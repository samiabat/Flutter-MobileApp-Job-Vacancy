import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.access,
    required this.refresh,
  });
  late final String access;
  late final String refresh;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    access = json["access"];
    refresh = json["refresh"];
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['access'] = access;
  //   _data['refresh'] = refresh;
  //   return _data;
  // }
}
