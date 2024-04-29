// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:milkymo/app/data/local_storage/hive/hive_preferences.dart';
// import 'package:milkymo/app/data/models/refresh_token_model.dart';
// import 'package:milkymo/app/data/repositories/auth_repository.dart';
// import 'package:milkymo/app/routes/app_pages.dart';
// import 'package:milkymo/app/utils/config.dart';
// import 'package:milkymo/app/utils/logger.dart';

// class DioUtil {
//   static Dio _instance = Dio();
// //method for getting dio instance
//   static Dio getInstance() {
//     if (_instance == null) {
//       _instance = createDioInstance();
//     }
//     return _instance;
//   }

//   static Dio createDioInstance() {
//     var dio = Dio();
//     // adding interceptor
//     dio.interceptors.clear();
//     dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
//       return handler.next(options); //modify your request
//     }, onResponse: (response, handler) {
//       if (response != null) {
//         //on success it is getting called here
//         return handler.next(response);
//       } else {
//         return;
//       }
//     }, onError: (DioException e, handler) async {
//       if (e.response != null) {
//         if (e.response?.statusCode == 401) {
//           //catch the 401 here
//           dio.interceptors.requestLock.lock();
//           dio.interceptors.responseLock.lock();
//           RequestOptions requestOptions = e.requestOptions;

//           await refreshToken();

//           var accessToken = getAccessToken();
//           final opts = Options(method: requestOptions.method);
//           dio.options.headers["Authorization"] = "Bearer $accessToken";
//           dio.options.headers["Accept"] = "*/*";
//           dio.interceptors.requestLock.unlock();
//           dio.interceptors.responseLock.unlock();
//           final response = await dio.request(requestOptions.path,
//               options: opts,
//               cancelToken: requestOptions.cancelToken,
//               onReceiveProgress: requestOptions.onReceiveProgress,
//               data: requestOptions.data,
//               queryParameters: requestOptions.queryParameters);
//           if (response != null) {
//             handler.resolve(response);
//           } else {
//             return null;
//           }
//         } else {
//           handler.next(e);
//         }
//       }
//     }));
//     return dio;
//   }

//   static refreshToken() async {
//     var dio = Dio();
//     final Uri apiUrl = Uri.parse("${Config.serverUrl}users/refresh-token");
//     var refreshToken = getRefreshToken();
//     dio.options.headers["Authorization"] = "Bearer $refreshToken";
//     try {
//       var response = await dio.postUri(apiUrl);
//       if (response.statusCode == 200) {
//         RefreshTokenModel refreshTokenResponse =
//             RefreshTokenModel.fromJson(jsonDecode(response.toString()));
//         saveAccessToken(refreshTokenResponse.data.accessToken);
//       } else {
//         AuthRepository.instance.logout();
//         Log.cat.i(response.toString());
//       }
//     } catch (e) {
//       AuthRepository.instance.logout();
//       Log.cat.e(e.toString());
//     }
//   }
// }
