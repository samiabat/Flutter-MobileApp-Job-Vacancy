import 'package:flutter/material.dart';

class ManageUserpage extends StatelessWidget {
  const ManageUserpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' ManageUser'),
        centerTitle: true,
        elevation: 12.0,
      ),
      body: const Center(
        child: Text(
          'table management for the user',
          style: TextStyle(
            fontSize: 48,
            color: Color.fromARGB(255, 255, 64, 64),
          ),
        ),
      ),
    );
  }
}
