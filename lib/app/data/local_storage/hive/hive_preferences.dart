import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:milkymo/app/utils/logger.dart';

Future<void> initFlutterHive() async {
  await Hive.initFlutter();
  await Hive.openBox("userData");
  await Hive.openBox("presentation");
}

Future<void> saveRememberMe(bool? rememberMe) async {
  await Hive.box("presentation").put("rememberMe", rememberMe);
}

bool getRememberMe() {
  return Hive.box("presentation").get("rememberMe", defaultValue: false);
}

Future<void> saveDeviceid(String? deviceId) async {
  await Hive.box("userData").put("device_id", deviceId);
}

String? getDeviceid() {
  return Hive.box("userData").get("device_id", defaultValue: null);
}

Future<void> saveUid(String? uid) async {
  await Hive.box("userData").put("uid", uid);
}

String? getUid() {
  return Hive.box("userData").get("uid", defaultValue: null);
}

Future<void> saveAccessToken(String? accessToken) async {
  await Hive.box("userData").put("accessToken", accessToken);
}

Future<void> saveRefreshToken(String? refreshToken) async {
  await Hive.box("userData").put("refreshToken", refreshToken);
}

Future<void> saveIdPeternak(String? idPeternak) async {
  await Hive.box("userData").put("idPeternak", idPeternak);
}

Future<void> saveUserName(String? userName) async {
  await Hive.box("userData").put("userName", userName);
}

Future<void> saveUserAddress(String? address) async {
  await Hive.box("userData").put("address", address);
}

Future<void> saveUserPhoneNumber(String? phoneNumber) async {
  await Hive.box("userData").put("phoneNumber", phoneNumber);
}

String? getAccessToken() {
  return Hive.box("userData").get("accessToken", defaultValue: null);
}

String? getRefreshToken() {
  return Hive.box("userData").get("refreshToken", defaultValue: null);
}

String? getIdPeternak() {
  return Hive.box("userData").get("idPeternak", defaultValue: null);
}

String? getUserName() {
  return Hive.box("userData").get("userName", defaultValue: null);
}

String? getPhoneNumber() {
  return Hive.box("userData").get("phoneNumber", defaultValue: null);
}

String? getAddress() {
  return Hive.box("userData").get("address", defaultValue: null);
}

Future<void> deleteAllUserData() async {
  final box = Hive.box("userData");
  if (getRememberMe() == false) {
    box.delete("idPeternak");
  }
  box.delete("accessToken");
  box.delete("refreshToken");
  box.delete("userName");
  box.delete("phoneNumber");
  box.delete("address");
  if (kDebugMode) Log.cat.i(box.keys);
}
