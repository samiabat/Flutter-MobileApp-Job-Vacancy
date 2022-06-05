import 'package:flutter/material.dart';
import 'package:job_vacancy/user/user_data_provider/user_data_provider.dart';
import 'package:job_vacancy/user/user_data_provider/route_controller.dart';

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
              loginInfo.logout();
            },
            icon: const Icon(Icons.logout)),
      ),
    );
  }
}
