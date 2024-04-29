import 'package:get/get.dart';
import 'package:milkymo/app/data/local_storage/hive/hive_preferences.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  RxString userName = getUserName().toString().obs;
  RxString userId = getIdPeternak().toString().obs;
  RxString phoneNumber = getPhoneNumber().toString().obs;
  RxString address = getAddress().toString().obs;
}
