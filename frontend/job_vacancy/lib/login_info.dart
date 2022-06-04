import 'package:flutter/cupertino.dart';
import 'package:job_vacancy/authentication/service/shared_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginInfo extends ChangeNotifier {
  var accessToken;
  Future<bool> get loggedIn async => await log();

  Future<bool> log() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      accessToken = sp.getString("access");
      print(accessToken);
    } catch (_) {
      accessToken = null;
      return false;
    }
    print(accessToken);
    return accessToken != null;
  }

  void logout() async {
    print("logout");
    SharedService.logout();
    notifyListeners();
  }
}
