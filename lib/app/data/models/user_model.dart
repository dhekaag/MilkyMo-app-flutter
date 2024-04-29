// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool status;
  int statusCode;
  Data data;

  UserModel({
    required this.status,
    required this.statusCode,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        statusCode: json["statusCode"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "data": data.toJson(),
      };
}

class Data {
  String id;
  String uid;
  String idPeternak;
  String name;
  String password;
  String email;
  String phoneNumber;
  String address;
  dynamic qrCode;
  String role;
  List<dynamic>? transactions;
  DateTime createdAt;
  DateTime updatedAt;
  int? v;

  Data({
    required this.id,
    required this.uid,
    required this.idPeternak,
    required this.name,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.qrCode,
    required this.role,
    this.transactions,
    required this.createdAt,
    required this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        uid: json["uid"],
        idPeternak: json["id_peternak"],
        name: json["name"],
        password: json["password"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        qrCode: json["qr_code"],
        role: json["role"],
        transactions: List<dynamic>.from(json["transactions"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "uid": uid,
        "id_peternak": idPeternak,
        "name": name,
        "password": password,
        "email": email,
        "phone_number": phoneNumber,
        "address": address,
        "qr_code": qrCode,
        "role": role,
        "transactions": List<dynamic>.from(transactions!.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
