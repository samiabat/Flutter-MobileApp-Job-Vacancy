import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img20.jpeg"), fit: BoxFit.cover)),
      ),
      const Positioned(
          right: 65,
          left: 65,
          top: 145,
          child: Text("We will send you password reset link through your email",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 236, 229, 229)))),
      const Positioned(
        right: 65,
        left: 65,
        top: 215,
        child: TextField(
          style:  TextStyle(color: Color.fromARGB(255, 236, 229, 229)),
          //controller: nameController,
          decoration:  InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 236, 229, 229), width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 236, 229, 229), width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            labelText: 'email',
            labelStyle: TextStyle(color: Color.fromARGB(255, 236, 229, 229)),
          ),
        ),
      ),
      Positioned(
          right: 10,
          left: 10,
          top: 285,
          child: Center(
              child: ElevatedButton(
            child:
                const Text('reset password', style: TextStyle(fontSize: 16.0)),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 49, 63, 34)),
            ),
            onPressed: () {},
          ))),
    ]));
  }
}
