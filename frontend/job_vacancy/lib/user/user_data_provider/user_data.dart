import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_vacancy/user/user_data_provider/shared_service.dart';
import 'package:job_vacancy/user/user_models/user_login_model.dart';
import 'package:job_vacancy/user/user_models/user_login_response.dart';
import 'package:job_vacancy/user/user_models/user_register.dart';

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

  static Future<bool> login(
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
      await SharedService.login(
        loginResponseJson(
          response.body,
        ),
      );

      return true;
    } else {
      return false;
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
    }
  }

  Future<void> updateUser(RegisterRequestModel userData) async {
    final http.Response responce = await client.put(
      Uri.parse('$_baseUrl/jobs/${userData.id}/'),
      headers: <String, String>{
        'Content-Type': 'application/json;charset:utf-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'id': userData.id,
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
