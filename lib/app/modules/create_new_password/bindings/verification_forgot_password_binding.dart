import 'package:get/get.dart';

import '../controllers/verification_forgot_password_controller.dart';

class CreateNewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateNewPasswordController>(
      () => CreateNewPasswordController(),
    );
  }
}
