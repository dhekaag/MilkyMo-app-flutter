// To parse this JSON data, do
//
//     final transactionsModel = transactionsModelFromJson(jsonString);

import 'dart:convert';

TransactionsModel transactionsModelFromJson(String str) =>
    TransactionsModel.fromJson(json.decode(str));

String transactionsModelToJson(TransactionsModel data) =>
    json.encode(data.toJson());

class TransactionsModel {
  bool? status;
  int? statusCode;
  int? count;
  double? total;
  List<TransactionDataModel>? data;

  TransactionsModel({
    this.status,
    this.statusCode,
    this.count,
    this.total,
    this.data,
  });

  factory TransactionsModel.fromJson(Map<String, dynamic> json) =>
      TransactionsModel(
        status: json["status"],
        statusCode: json["statusCode"],
        count: json["count"],
        total: json["total"]?.toDouble(),
        data: json["data"] == null
            ? []
            : List<TransactionDataModel>.from(
                json["data"]!.map((x) => TransactionDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "count": count,
        "total": total,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TransactionDataModel {
  String? id;
  String? transactionId;
  String? userId;
  String? userName;
  String? time;
  double? milkVolume;
  String? adminId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  TransactionDataModel({
    this.id,
    this.transactionId,
    this.userId,
    this.userName,
    this.time,
    this.milkVolume,
    this.adminId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory TransactionDataModel.fromJson(Map<String, dynamic> json) =>
      TransactionDataModel(
        id: json["_id"],
        transactionId: json["transaction_id"],
        userId: json["user_id"],
        userName: json["user_name"],
        time: json["time"],
        milkVolume: json["milk_volume"]?.toDouble(),
        adminId: json["admin_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "transaction_id": transactionId,
        "user_id": userId,
        "user_name": userName,
        "time": time,
        "milk_volume": milkVolume,
        "admin_id": adminId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
