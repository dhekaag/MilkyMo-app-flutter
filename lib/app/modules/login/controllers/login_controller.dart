import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  var isPasswordHidden = true.obs;
  final formKey = GlobalKey<FormState>();
  var rememberMe = false.obs;
}
