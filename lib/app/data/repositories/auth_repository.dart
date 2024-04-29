// ignore_for_file: prefer_final_fields

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:milkymo/app/data/local_storage/hive/hive_preferences.dart';
import 'package:milkymo/app/data/services/dio/dio_interceptor.dart';
import 'package:milkymo/app/routes/app_pages.dart';
import 'package:milkymo/app/data/services/dio/custom_exception.dart';
import 'package:milkymo/app/utils/logger.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    setInitialScreen(_user.value);
  }

  // * access token from local storage
  Rx<String?> _user = getAccessToken().obs;

  void setInitialScreen(String? accessToken) {
    if (kDebugMode) Log.cat.d("access token = $_user");
    if (accessToken == null) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR);
    }
  }

  final _dio = DioInterceptor().dio;
  Future<String?> login(String idPeternak, String password) async {
    try {
      Response response = await _dio.post("users/login",
          data: json.encode({"id_peternak": idPeternak, "password": password}));
      // Check if response is successful (status code between 200 and 300)

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        if (kDebugMode) Log.cat.i(response.data["data"]);
        saveUid(response.data["data"]["uid"]);
        saveIdPeternak(idPeternak);
        saveAccessToken(response.data["data"]["accessToken"]);
        saveRefreshToken(response.data["data"]["refreshToken"]);
        fetchUserData(
            userId: idPeternak,
            accessToken: response.data["data"]["accessToken"]);
        if (kDebugMode) {
          Log.cat.i("access token : ${response.data["data"]["accessToken"]}");
          Log.cat.i("refresh token : ${response.data["data"]["refreshToken"]}");
          Log.cat.i("id peternak : $idPeternak");
        }
        return response.data["data"]["accessToken"];
      } else if (response.statusCode! >= 400 && response.statusCode! < 500) {
        throw "Invalid username or password";
      } else if (response.statusCode! >= 500 && response.statusCode! < 600) {
        throw "Internal Server Error";
      }
      // return null;
    } on DioException catch (error) {
      // ! if error from Exception
      Log.cat.e(error);
      final errMessage = CustomException.fromDioException(error);
      // Get.defaultDialog(title: "Login Error", middleText: errMessage.message);
      throw errMessage.message;
    }
    return null;
  }

  Future<String?> fetchUserData({String? userId, String? accessToken}) async {
    try {
      Response response = await _dio.get(
        "users/$userId",
      );
      // if (kDebugMode) Log.cat.i(response.data);
      // Check if response is successful (status code between 200 and 300)
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        if (kDebugMode) Log.cat.i(response.data["data"]);

        saveUid(response.data["data"]["uid"]);
        saveUserName(response.data["data"]["name"]);
        saveUserAddress(response.data["data"]["address"]);
        saveUserPhoneNumber(response.data["data"]["phone_number"]);
        if (kDebugMode) {
          Log.cat.i("uid : ${response.data["data"]["uid"]}");
          Log.cat.i("name : ${response.data["data"]["name"]}");
          Log.cat.i("address : ${response.data["data"]["address"]}");
          Log.cat.i("phone number : ${response.data["data"]["phone_number"]}");
        }
        return response.data["data"]["name"];
      } else if (response.statusCode == 403) {
        throw Exception("authorization error: ${response.data["message"]}");
      } else if (response.statusCode! >= 400 && response.statusCode! < 500) {
        throw Exception("unknown error occured");
      } else if (response.statusCode! >= 500 && response.statusCode! < 600) {
        throw Exception("internal server error");
      }
    } on DioException catch (e) {
      // ! if error from Exception
      Log.cat.e(e);
      final errMessage = CustomException.fromDioException(e);
      return errMessage.message;
    }
    return null;
  }

  void logout() async {
    try {
      // * clear the token from the local storage
      await deleteAllUserData();
      Get.offAllNamed(Routes.LOGIN);

      if (kDebugMode) {
        Log.cat.i("access token = $getAccessToken()");
        Log.cat.i("refresh token = $getRefreshToken()");
        Log.cat.i("id peternak = $getIdPeternak()");
      }
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }
}
