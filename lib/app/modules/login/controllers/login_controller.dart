import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milkymo/app/data/local_storage/hive/hive_preferences.dart';
import 'package:milkymo/app/data/repositories/auth_repository.dart';
import 'package:milkymo/app/utils/logger.dart';

class LoginController extends GetxController with StateMixin {
  static LoginController get instance => Get.find();

  @override
  void onInit() {
    var newRememberMe = getRememberMe();
    var userId = getIdPeternak();
    if (newRememberMe == true) {
      rememberMe.value = newRememberMe;
      idPeternakController.value = TextEditingValue(text: userId!);
    }
    super.onInit();
  }

  var isPasswordHidden = true.obs;
  final formKey = GlobalKey<FormState>();
  var rememberMe = false.obs;
  RxBool isLoading = false.obs;

  TextEditingController idPeternakController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    try {
      change(null, status: RxStatus.loading());
      isLoading.value = true;
      final auth = AuthRepository.instance;

      var response =
          await auth.login(idPeternakController.text, passwordController.text);
      if (response != null) {
        saveRememberMe(rememberMe.value);
        Future.delayed(const Duration(milliseconds: 500))
            .then((value) => auth.setInitialScreen(response))
            .then((value) => isLoading.value = false);
        // auth.setInitialScreen(response);
        // isLoading.value = false;
        change(response, status: RxStatus.success());
      } else {
        isLoading.value = false;
        // change(response, status: RxStatus.error(response.message));
        Get.defaultDialog(title: "Login Error", middleText: response!);
      }
    } catch (e) {
      Log.cat.e(e.toString());
      change(e, status: RxStatus.error(e.toString()));
      isLoading.value = false;
      Get.defaultDialog(title: "Login Error", middleText: e.toString());
    }
  }
}
