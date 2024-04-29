import 'package:get/get.dart';
import 'package:milkymo/app/data/repositories/transaction_repository.dart';
import 'package:milkymo/app/modules/qr_code/controllers/qr_code_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<TransactionRepository>(
      () => TransactionRepository(),
    );
    Get.lazyPut<QrCodeController>(
      () => QrCodeController(),
    );
  }
}
