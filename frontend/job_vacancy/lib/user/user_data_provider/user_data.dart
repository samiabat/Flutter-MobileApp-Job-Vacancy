import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:job_vacancy/user/user_data_provider/route_controller.dart';
import 'package:job_vacancy/user/user_models/login_request_model.dart';
import 'package:job_vacancy/user/user_models/login_response_model.dart';
import 'package:job_vacancy/user/user_models/profile_model.dart';
import 'package:job_vacancy/user/user_models/registeration_request.dart';
import 'package:job_vacancy/user/user_models/registeration_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider {
  static const _baseUrl = 'http://127.0.0.1:8000';
  static var client = http.Client();

  // Future<void> register(RegisterRequestModel userData) async {
  //   final responce = await httpClient.post(
  //     (Uri.parse('$_baseUrl/users/')),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json;charset:utf-8',
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       'username': userData.username,
  //       'email': userData.email,
  //       'password': userData.password,
  //     }),
  //   );

  //   if (responce.statusCode == 200) {
  //     return await RegisterRequestModel.fromJson(jsonDecode(responce.body));
  //   } else {
  //     throw Exception('Failed to Create the Acount');
  //   }
  // }

  Future<bool> login(
    LoginRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var response = await client.post(
      Uri.parse('$_baseUrl/api/login/'),
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      var loginResponse = loginResponseJson(response.body);
      loginInfo.login(loginResponse.access, loginResponse.refresh);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getProfile() async {
    var tk = await SharedPreferences.getInstance();
    String? token = tk.getString("access");

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await client.get(Uri.parse('$_baseUrl/profile/'),
        headers: requestHeaders);

    if (response.statusCode == 200) {
      var profileResponce = profileJson(response.body);
      loginInfo.register(profileResponce.user, profileResponce.role,
          profileResponce.id, profileResponce.email);
      return true;
    } else {
      return false;
    }
  }

  Future<RegisterRequestModel> userById(String? id) async {
    var tk = await SharedPreferences.getInstance();
    String? token = tk.getString("access");

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final responce = await client.get(Uri.parse('$_baseUrl/users/$id/'),
        headers: requestHeaders);

    if (responce.statusCode == 200) {
      final user = jsonDecode(responce.body);
      return RegisterRequestModel.fromJson(user);
    } else {
      throw Exception('Failed load jobs');
    }
  }

  Future<List<RegisterRequestModel>> getUsers() async {
    var tk = await SharedPreferences.getInstance();
    String? token = tk.getString("access");

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final responce = await client.get(Uri.parse('$_baseUrl/users/'),
        headers: requestHeaders);

    if (responce.statusCode == 200) {
      final users = jsonDecode(responce.body) as List;
      return users.map((user) => RegisterRequestModel.fromJson(user)).toList();
    } else {
      throw Exception('Failed load jobs');
    }
  }

  Future<void> deleteByUsername(String username) async {
    final http.Response responce = await client.delete(
      Uri.parse('$_baseUrl/users/$username/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (responce.statusCode != 204) {
      throw Exception('Failed to delete !');
    }
  }

  Future<void> deleteAccount(String id) async {
    final http.Response responce = await client.delete(
      Uri.parse('$_baseUrl/users/$id/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (responce.statusCode != 204) {
      throw Exception('Failed to delete !');
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      prefs.remove("access");
      prefs.remove("refresh");
    } catch (_) {}
  }

  Future<RegisterResponseModel> register(
    RegisterRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var response = await client.post(
      Uri.parse("$_baseUrl/users/"),
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseJson(
      response.body,
    );
  }

  Future<void> updateUser(RegisterRequestModel userData) async {
    final http.Response responce = await client.put(
      Uri.parse('$_baseUrl/jobs/$userData/'),
      headers: <String, String>{
        'Content-Type': 'application/json;charset:utf-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'id': userData,
          'username': userData.username,
          'email': userData.email,
          'password': userData.password,
        },
      ),
    );

    if (responce.statusCode != 204) {
      throw Exception('Failed to update course.');
    }
  }
}

class LoginInfo extends ChangeNotifier {
  var _isLoggedin = false;
  var _role = false;

  get getrole => _role;
  set setrole(bool value) {
    _role = value;
  }

  get getName => _isLoggedin;
  set setName(bool value) {
    _isLoggedin = value;
    notifyListeners();
  }

  Future<String?> log() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString("access");
  }

  void register(String name, String role, String id, String email) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("username", name);
    prefs.setString("role", role);
    prefs.setString("userid", id);
    prefs.setString("email", email);
  }

  void login(String access, String refresh) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("access", access);
    prefs.setString("refresh", refresh);
    try {
      setrole = prefs.getBool("role")!;
    } catch (_) {}
    setName = true;
  }

  void logout() async {
    var prefs = await SharedPreferences.getInstance();
    try {
      prefs.remove("access");
      prefs.remove("refresh");
      setName = false;
    } catch (_) {}
  }
}
