import 'package:flutter/material.dart';

class Logoutpage extends StatelessWidget {
  const Logoutpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Logout'),
          centerTitle: true,
          elevation: 12.0,
        ),
        body: const Center(
          child: Text('Logout is successfull',
              style: TextStyle(
                fontSize: 48,
                color: Color.fromARGB(255, 89, 255, 64),
              )),
        ));
  }
}
