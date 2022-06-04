import 'package:flutter/material.dart';
import 'package:job_vacancy/authentication/login/models/login_responce_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService extends ChangeNotifier {
  static Future<bool> isLoggedIn() async {
    var prefs = await SharedPreferences.getInstance();
    var token = await prefs.getString("access");
    if (token != null) return true;
    return false;
  }

  static Future loginDetails() async {
    var service = await SharedService();
    var token = await service;
    if (token != null) {
      return token;
    }
    return null;
  }

  static Future<void> login(
    LoginResponseModel loginResponse,
  ) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("access", loginResponse.access);
    prefs.setString("refresh", loginResponse.refresh);
  }


  static Future<void> logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove("access");
    await prefs.remove("refresh");
  }
}
