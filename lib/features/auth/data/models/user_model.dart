

import 'package:verblet/core/common/entities/user.dart';

class UserModel extends User{
  UserModel({required super.id, required super.email, required super.name});

  factory UserModel.fromJson(Map<String, dynamic> map){
    return UserModel(id: map['id'] ?? '', email: map['email'] ?? '', name: map['name'] ?? '');
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
}){
    return UserModel(id: id ?? '', email: email ?? '', name: name ?? '');
  }
}