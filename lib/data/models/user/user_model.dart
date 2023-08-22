import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class UserModel {
  UserModel(
      {required this.password,
      required this.email,
      this.id = 0,
      required this.username,
      required this.avatar,
      required this.contact,
      required this.gender,
      required this.profession,
      required this.role});

  final int id;
  final String username;
  final String contact;
  final String email;
  final String password;
  final String avatar;
  final String profession;
  final String role;
  final String gender;

  UserModel copyWith(
      {String? username,
      String? password,
      String? avatar,
      String? contact,
      String? gender,
      String? profession,
      String? role,
      String? email,
      int? id}) {
    return UserModel(
        password: password ?? this.password,
        email: email ?? this.email,
        username: username ?? this.username,
        avatar: avatar ?? this.avatar,
        contact: contact ?? this.contact,
        gender: gender ?? this.gender,
        profession: profession ?? this.profession,
        role: role ?? this.role);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      password: json["password"] as String? ?? "",
      email: json["email"] as String? ?? "",
      username: json["username"] as String? ?? "",
      id: json["id"] as int? ?? 0,
      avatar: json["avatar"] as String? ?? "",
      contact: json["contact"] as String? ?? "",
      gender: json["gender"] as String? ?? "",
      profession: json["profession"] as String? ?? "",
      role: json["role"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
      "email": email,
      "avatar": avatar,
      "contact": contact,
      "gender": gender,
      "profession": profession,
      "role": role
    };
  }

  Future<FormData> getFormatData(XFile file) async {
    String fileName = file.path.split('/').last;
    return FormData.fromMap({
      "username": username,
      "password": password,
      "email": email,
      "avatar": await MultipartFile.fromFile(file.path, filename: fileName),
      "contact": contact,
      "gender": gender,
      "profession": profession,
      "role": role
    });
  }
}
