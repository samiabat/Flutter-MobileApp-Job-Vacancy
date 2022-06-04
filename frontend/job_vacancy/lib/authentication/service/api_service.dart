import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_vacancy/authentication/login/models/login_request_model.dart';
import 'package:job_vacancy/authentication/login/models/login_responce_model.dart';
import 'package:job_vacancy/authentication/registration/models/register_request_model.dart';
import 'package:job_vacancy/authentication/registration/models/register_responce_model.dart';
import 'package:job_vacancy/authentication/service/shared_service.dart';

class APIService {
  static var client = http.Client();
  static const _baseUrl = 'http://127.0.0.1:8000';
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

  static Future<RegisterResponseModel> register(
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

  static Future<String> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails}'
    };
    var response = await client.get(
      Uri.parse("$_baseUrl/profile"),
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
