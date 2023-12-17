import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordController extends GetxController {
  static CreateNewPasswordController get instance => Get.find();

  RxBool isNewPasswordHidden = true.obs;
  RxBool isConfirmNewPasswordHidden = true.obs;
  final formKey = GlobalKey<FormState>();
}
