class RegisterRequestModel {
  RegisterRequestModel({
    this.username,
    this.email,
    this.password,
    this.repeatPassword,
  });
  late final String? username;
  late final String? password;
  late final String? email;
  late final String? repeatPassword;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
    repeatPassword = json['repeatPassword'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['password'] = password;
    _data['repeatPassword'] = repeatPassword;
    return _data;
  }
}
