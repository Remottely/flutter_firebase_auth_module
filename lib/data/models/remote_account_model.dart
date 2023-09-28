import 'dart:convert';

import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';

class RemoteAccountModel {
  final String id;
  final String fullName;
  final String email;
  final String birthday;

  RemoteAccountModel(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.birthday});

  AccountEntity toEntity() => AccountEntity(
        id: id,
        fullName: fullName,
        email: email,
        birthday: birthday,
      );

  factory RemoteAccountModel.fromMap(Map<String, dynamic> map) {
    if (!map.keys.toSet().containsAll([
      'id',
      'fullName',
      'email',
      'birthday',
    ])) {
      throw Exception('[FirebaseFirestoreError.invalidData]');
    }
    return RemoteAccountModel(
      id: map['id'] as String,
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      birthday: map['birthday'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'fullName': fullName,
        'email': email,
        'birthday': birthday,
      };

  factory RemoteAccountModel.fromJson(String source) =>
      RemoteAccountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
}
