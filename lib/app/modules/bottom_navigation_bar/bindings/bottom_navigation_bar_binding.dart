import 'package:get/get.dart';
import 'package:milkymo/app/modules/home/controllers/home_controller.dart';
import 'package:milkymo/app/modules/qr_code/controllers/qr_code_controller.dart';
import 'package:milkymo/app/modules/transaction_history/controllers/transaction_history_controller.dart';

import '../controllers/bottom_navigation_bar_controller.dart';

class BottomNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationBarController>(
      () => BottomNavigationBarController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<TransactionHistoryController>(
      () => TransactionHistoryController(),
    );
    Get.lazyPut<QrCodeController>(
      () => QrCodeController(),
    );
  }
}
