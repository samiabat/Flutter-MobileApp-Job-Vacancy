class RegisterRequestModel {
  RegisterRequestModel({
    this.id = '',
    this.username,
    this.password,
    this.email, required String repeatPassword,
  });
  late final String? id;
  late final String? username;
  late final String? password;
  late final String? email;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['password'] = password;
    _data['email'] = email;
    return _data;
  }
}
