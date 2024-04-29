import 'package:get/get.dart';
import 'package:milkymo/app/data/local_storage/hive/hive_preferences.dart';

class QrCodeController extends GetxController {
  static QrCodeController get instance => Get.find();

  var userId = getIdPeternak().obs;
  var userName = getUserName().obs;
}
