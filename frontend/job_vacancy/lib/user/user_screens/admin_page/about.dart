import 'package:flutter/material.dart';

class Aboutpage extends StatelessWidget {
  const Aboutpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
        elevation: 12.0,
      ),
      body: const Center(
        child: Text('About  page is here',
            style: TextStyle(
              fontSize: 48,
              color: Color.fromARGB(255, 89, 255, 64),
            )),
      ),
    );
  }
}
