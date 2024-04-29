import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:milkymo/app/data/models/auth_model.dart';
import 'package:milkymo/app/data/models/user_model.dart';
import 'package:milkymo/app/data/services/dio/custom_exception.dart';
import 'package:milkymo/app/data/services/dio/dio_interceptor.dart';
import 'package:milkymo/app/utils/logger.dart';

class AuthServices {
  final _dio = DioInterceptor().dio; 
  Future<dynamic> loginService(String idPeternak, String password) async {
    try {
      final response = await _dio.post("users/login",
          data: json.encode({"id_peternak": idPeternak, "password": password}));
      // Check if response is successful (status code between 200 and 300)
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return AuthModel.fromJson(response.data);
      } else if (response.statusCode! >= 400 && response.statusCode! < 500) {
        return "Username or password is incorrect";
      } else if (response.statusCode! >= 500 && response.statusCode! < 600) {
        return "internal server error";
      }
    } on DioException catch (error) {
      final errorMessage = CustomException.fromDioException(error);
      Log.cat.e(error.message);
      throw errorMessage.message;
    }
    // If none of the above conditions are met, return null
    return null;
  }

  Future<UserModel?> fetchUserDataService(String? userId) async {
    try {
      final response = await _dio.get("users/$userId");
      if (kDebugMode) Log.cat.i(response.data);
      // Check if response is successful (status code between 200 and 300)
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return UserModel.fromJson(response.data);
      } else if (response.statusCode! >= 400 && response.statusCode! < 500) {
        throw "unknown error";
      } else if (response.statusCode! >= 500 && response.statusCode! < 600) {
        throw "internal server error";
      }
    } on DioException catch (e) {
      Log.cat.e(e);
      throw e.message.toString();
    }

    return null;
  }
}
