import 'dart:convert';

ProfileModel profileJson(String str) => ProfileModel.fromJson(json.decode(str));

class ProfileModel {
  ProfileModel({
    required this.user,
    required this.role,
    required this.id,
    required this.email,
  });
  late final String user;
  late final String role;
  late final String id;
  late final String email;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    user = json["user"];
    role = json["role"];
    id = json['id'];
    email = json['email'];
  }
}
