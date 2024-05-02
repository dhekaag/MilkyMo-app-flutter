import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';
import 'package:milkymo/app/data/local_storage/hive/hive_preferences.dart';
import 'package:milkymo/app/data/repositories/auth_repository.dart';
import 'package:milkymo/app/utils/logger.dart';
import 'package:milkymo/google_cloud_logging_service.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  _portraitModeOnly();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: ".env");
  await initFlutterHive();
  await initializeDateFormatting('id_ID', null);
  // Setup Cloud Logging API
  _setUpCloudLoggingApi();
  // Setup One Signal for push notification
  _setUpOneSignalPushNotification();

  // Initialize Authentication Repository
  Get.put(AuthRepository());
  // Run the application
  Future.delayed(const Duration(milliseconds: 400))
      .then((value) => runApp(const Myapp()));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      ensureScreenSize: true,
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale('id')],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          brightness: Brightness.light,
          fontFamily: "Poppins",
        ),
        title: "MilkyMo",
        home: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        getPages: AppPages.routes,
      ),
    );
  }
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      // systemNavigationBarColor: Colors.transparent,
    ),
  );
}

void _setUpOneSignalPushNotification() {
//Remove this method to stop OneSignal Debugging
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("0292ae1b-6b9d-4a64-9413-ae6de68ed6fb");
  // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.Notifications.requestPermission(true);
}

void _setUpCloudLoggingApi() async {
  final googleCloudLoggingService = GoogleCloudLoggingService();
  await googleCloudLoggingService
      .setupLoggingApi()
      .then((value) => Log.cat.i('Setup Logging API completed'));

  // Use the output listener from the Logger package to write logs to Cloud Logging
  Logger.addOutputListener((event) {
    if (kReleaseMode) {
      // Only write logs to Cloud Logging in release mode
      googleCloudLoggingService.writeLog(
        level: event.level,
        message: event.lines.join(
            '\n'), // Join the log lines with a new line, so that it is written as a single message
      );
      debugPrint('App will log output to Cloud Logging');
    }
  });
}

// ? test set up cloud loggin api
// void _setUpCloudLoggingApi() async {
//   final Stopwatch stopwatch = Stopwatch(); // Stopwatch untuk mengukur waktu
//   stopwatch.start(); // Mulai stopwatch

//   await googleCloudLoggingService.setupLoggingApi().then((_) {
//     stopwatch.stop(); // Stop stopwatch ketika selesai
//     final double seconds = stopwatch.elapsedMilliseconds /
//         1000; // Hitung waktu yang diperlukan dalam detik
//     Log.cat.d(
//         'Setup Logging API completed in ${seconds.toStringAsFixed(2)} seconds.');
//   });

//   // Gunakan output listener dari paket Logger untuk menulis log ke Cloud Logging
//   Logger.addOutputListener((event) {
//     if (!kReleaseMode) {
//       // Hanya tulis log ke Cloud Logging dalam mode rilis
//       googleCloudLoggingService.writeLog(
//         level: event.level,
//         message: event.lines.join(
//             '\n'), // Gabungkan baris log dengan baris baru, sehingga ditulis sebagai satu pesan
//       );
//       debugPrint('App will log output to Cloud Logging');
//     }
//   });
// }
