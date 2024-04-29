// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:milkymo/app/data/models/transaction_model.dart';
import 'package:milkymo/app/data/services/dio/dio_interceptor.dart';
import 'package:milkymo/app/utils/logger.dart';

class TransactionRepository extends GetxController {
  static TransactionRepository get instance => Get.find();

  // Rx<String?> _idPeternak = getIdPeternak().obs;

  final _dio = DioInterceptor().dio;

  Future<List<TransactionDataModel?>?> fetchTransactions(String uid) async {
    try {
      final response = await _dio.get("transactions/user/$uid");
      if (kDebugMode) {
        Log.cat.i("Response Status Code: ${response.statusCode}");
        Log.cat.i("Response Data: ${response.data}");
      }
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        // final responseMap = json.decode(response.data);
        final transactionsModel = TransactionsModel.fromJson(response.data);
        if (kDebugMode) Log.cat.i(transactionsModel.count);

        return transactionsModel.data;
      } else if (response.statusCode! >= 400 && response.statusCode! < 500) {
        Log.cat.e(response.data["message"]);
        throw Exception("Transactions not found");
      } else if (response.statusCode! >= 500 && response.statusCode! <= 600) {
        Log.cat.e(response.data);
        throw Exception("internal server erorr");
      }
    } on DioException catch (e) {
      Log.cat.e(e.toString());
      throw e.message.toString();
    }
    return null;
  }
}
