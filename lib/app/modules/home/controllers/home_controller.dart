// ignore_for_file: unnecessary_getters_setters

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:milkymo/app/data/local_storage/hive/hive_preferences.dart';
import 'package:milkymo/app/data/models/transaction_model.dart';
import 'package:milkymo/app/data/repositories/auth_repository.dart';
import 'package:milkymo/app/data/repositories/transaction_repository.dart';
import 'package:milkymo/app/utils/logger.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeController extends GetxController with StateMixin<String> {
  static HomeController get instance => Get.find();

  @override
  void onReady() {
    super.onReady();
    String? idPeternak = getIdPeternak();
    String? accessToken = getAccessToken();
    if (idPeternak != null && accessToken != null) {
      AuthRepository.instance
          .fetchUserData(userId: idPeternak, accessToken: accessToken);
    }
    fetchTransactions();
    isLoading.value = false;
  }

  RxBool isLoading = true.obs;
  Rx<String?> userName = getUserName().obs;

  RxString selectedTime =
      DateFormat("EEEE, d MMMM y", "id_ID").format(DateTime.now()).obs;
  RxString? selectedDropDownValue = "Semua".obs;

  Rx<DateTime?>? rangeStart =
      Rx<DateTime?>(DateTime.now().subtract(const Duration(days: 6)));
  Rx<DateTime?>? rangeEnd = Rx<DateTime?>(DateTime.now());
  Rx<DateTime?>? selectedDay = Rx<DateTime?>(DateTime.now());
  final Rx<DateTime?> focusedDay = Rx<DateTime?>(DateTime.now());
  Rx<DateTime?>? newPickedStartDate =
      Rx<DateTime?>(DateTime.now().subtract(const Duration(days: 6)));
  Rx<DateTime?>? newPickedEndDate = Rx<DateTime?>(DateTime.now());
  RxBool isDatePickerSucced = false.obs;

  final Rx<CalendarFormat> calendarFormat =
      Rx<CalendarFormat>(CalendarFormat.month);

  RxList<TransactionDataModel> transactionDataList =
      <TransactionDataModel>[].obs;

  void fetchTransactions() async {
    try {
      final transRepo = TransactionRepository.instance;
      var uid = getUid();

      List<TransactionDataModel?>? transactionResponse =
          await transRepo.fetchTransactions(uid!);
      if (transactionResponse != null) {
        transactionDataList.value = transactionResponse
            .where((transaction) => transaction != null)
            .map((transaction) => transaction!)
            .toList();
      }
    } catch (e) {
      Log.cat.e(e);

      Get.defaultDialog(
          title: "Fetch Transaction Error", middleText: e.toString());
    }
  }
}
