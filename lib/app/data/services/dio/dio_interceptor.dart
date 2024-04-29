import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/route_manager.dart';
import 'package:milkymo/app/data/local_storage/hive/hive_preferences.dart';
import 'package:milkymo/app/data/repositories/auth_repository.dart';
import 'package:milkymo/app/routes/app_pages.dart';
import 'package:milkymo/app/utils/config.dart';
import 'package:milkymo/app/utils/logger.dart';

class DioInterceptor extends Interceptor {
  Dio dio = Dio(BaseOptions(
    baseUrl: Config.serverUrl ?? "",
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
    responseType: ResponseType.json,
    contentType: "application/json",
    validateStatus: (status) => status != null && status <= 500 ? true : false,
  ));

  // addInterceptors(Dio dio) {
  //   dio.interceptors.add(DioInterceptor());
  //   if (kDebugMode) Log.cat.i("dio interceptor has been initialized");
  // }
  DioInterceptor() {
    addInterceptors(dio); // Panggil metode addInterceptors dalam konstruktor
  }

  void addInterceptors(Dio dio) {
    dio.interceptors.add(
        this); // Tambahkan instance DioInterceptor saat ini sebagai interceptor
    if (kDebugMode) Log.cat.i("dio interceptor has been initialized");
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? token = getAccessToken();
    options.headers.addAll({
      "Content-Type": "application/json",
    });
    // get token from the storage
    if (token != null) {
      options.headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Check if the user is unauthorized.
    if (err.response?.statusCode == 401) {
      // Refresh the user's authentication token.
      await refreshToken();
      // Retry the request.
      try {
        handler.resolve(await _retry(err.requestOptions));
      } on DioException catch (e) {
        // If the request fails again, pass the error to the next interceptor in the chain.
        handler.next(e);
      }
      // Return to prevent the next interceptor in the chain from being executed.
      return;
    }
    // Pass the error to the next interceptor in the chain.
    handler.next(err);
  }

  Future<String?> refreshToken() async {
    try {
      String? refreshToken = getRefreshToken();

      final response = await dio.post("users/refresh-token",
          data: json.encode({"refreshToken": refreshToken}));
      if (response.statusCode == 200) {
        final newAccessToken = response.data["data"]["refreshToken"];
        saveAccessToken(newAccessToken);
        return newAccessToken;
      }
    } catch (exception) {
      deleteAllUserData();
      AuthRepository.instance.logout();
      Get.offAllNamed(Routes.LOGIN);
    }
    return null;
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    var token = getAccessToken();
    // Create a new `RequestOptions` object with the same method, path, data, and query parameters as the original request.
    final options = Options(
      method: requestOptions.method,
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    // Retry the request with the new `RequestOptions` object.
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
