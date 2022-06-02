import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admins profile'),
        centerTitle: true,
        elevation: 12.0,
      ),
      body: const Center(
        child: Text('profile  page is here',
            style: TextStyle(
              fontSize: 48,
              color: Colors.orangeAccent,
            )),
      ),
    );
  }
}
