import 'package:get/get.dart';
import 'package:milkymo/app/data/local_storage/hive/hive_preferences.dart';
import 'package:milkymo/app/data/repositories/auth_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  Rx<RxStatus> profileState = RxStatus.empty().obs;
  RxString userName = getUserName().toString().obs;
  RxString userId = getIdPeternak().toString().obs;
  RxString phoneNumber = getPhoneNumber().toString().obs;
  RxString address = getAddress().toString().obs;

  void logout() async {
    try {
      profileState.value = RxStatus.loading();
      final authRes = await AuthRepository.instance.logout();
      if (authRes) {
        profileState.value = RxStatus.success();
      }
      profileState.value = RxStatus.empty();
    } catch (e) {
      profileState.value = RxStatus.error();
    }
  }
}
