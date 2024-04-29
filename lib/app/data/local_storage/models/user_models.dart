import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserLocalModel {
  final String? idPeternak;
  final String? name;
  final String? address;
  final String? phoneNumber;
  final String? accessToken;
  final String? refreshToken;
  UserLocalModel({
    this.idPeternak,
    this.name,
    this.address,
    this.phoneNumber,
    this.accessToken,
    this.refreshToken,
  });

  UserLocalModel copyWith({
    String? idPeternak,
    String? name,
    String? address,
    String? phoneNumber,
    String? accessToken,
    String? refreshToken,
  }) {
    return UserLocalModel(
      idPeternak: idPeternak ?? this.idPeternak,
      name: name ?? this.name,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idPeternak': idPeternak,
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory UserLocalModel.fromMap(Map<String, dynamic> map) {
    return UserLocalModel(
      idPeternak: map['idPeternak'] as String,
      name: map['name'] as String,
      address: map['address'] as String,
      phoneNumber: map['phoneNumber'] as String,
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLocalModel.fromJson(String source) =>
      UserLocalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserLocalModel(idPeternak: $idPeternak, name: $name, address: $address, phoneNumber: $phoneNumber, accessToken: $accessToken, refreshToken: $refreshToken)';
  }
}
