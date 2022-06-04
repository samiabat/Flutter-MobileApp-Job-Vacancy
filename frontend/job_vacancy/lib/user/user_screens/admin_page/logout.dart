import 'package:flutter/material.dart';
import 'package:job_vacancy/login_info.dart';

class Logoutpage extends StatefulWidget {
  const Logoutpage({Key? key}) : super(key: key);

  @override
  State<Logoutpage> createState() => _LogoutpageState();
}

class _LogoutpageState extends State<Logoutpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
            onPressed: () async {
              var logininfo = LoginInfo();
              logininfo.logout();
            },
            icon: const Icon(Icons.logout)),
      ),
    );
  }
}
