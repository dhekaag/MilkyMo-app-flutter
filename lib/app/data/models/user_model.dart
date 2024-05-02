// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool? status;
  int? statusCode;
  UserDataModel? data;

  UserModel({
    this.status,
    this.statusCode,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        statusCode: json["statusCode"],
        data:
            json["data"] == null ? null : UserDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "data": data?.toJson(),
      };
}

class UserDataModel {
  dynamic address;
  String? id;
  String? uid;
  String? idPeternak;
  String? name;
  String? password;
  String? email;
  String? phoneNumber;
  dynamic qrCode;
  String? role;
  List<String>? transactions;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? deviceId;

  UserDataModel({
    this.address,
    this.id,
    this.uid,
    this.idPeternak,
    this.name,
    this.password,
    this.email,
    this.phoneNumber,
    this.qrCode,
    this.role,
    this.transactions,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.deviceId,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        address: json["address"],
        id: json["_id"],
        uid: json["uid"],
        idPeternak: json["id_peternak"],
        name: json["name"],
        password: json["password"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        qrCode: json["qr_code"],
        role: json["role"],
        transactions: json["transactions"] == null
            ? []
            : List<String>.from(json["transactions"]!.map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        deviceId: json["device_id"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "_id": id,
        "uid": uid,
        "id_peternak": idPeternak,
        "name": name,
        "password": password,
        "email": email,
        "phone_number": phoneNumber,
        "qr_code": qrCode,
        "role": role,
        "transactions": transactions == null
            ? []
            : List<dynamic>.from(transactions!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "device_id": deviceId,
      };
}
