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
      home:  MyStatefulWidget(),
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
            image: DecorationImage(image: AssetImage("assets/img8.jpeg"), fit: BoxFit.cover)),
      ),
      
      Positioned(
      right:65,
      left:65,
      top:160,
      
        child: TextField(
          style: const TextStyle(color:Color.fromARGB(255, 180, 151, 151)),
          controller: nameController,
          decoration:  const InputDecoration(
           focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color:Color.fromARGB(255, 180, 151, 151),width:2.0),
                               borderRadius: BorderRadius.all(Radius.circular(25.0))
 ),
          enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 180, 151, 151), width: 2.0),
                               borderRadius: BorderRadius.all(Radius.circular(25.0))
 ),
            labelText: 'User Name or email',
            labelStyle: TextStyle(color:Color.fromARGB(255, 180, 151, 151)

          ),
        ),
      ),
      ),
      
      Positioned(
      right:65,
      left:65,
      top:240,
    
        child: TextField(
          style: const TextStyle(color:Color.fromARGB(255, 180, 151, 151)),
          obscureText: true,
          controller: passwordController,
          decoration:  const InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color:Color.fromARGB(255, 180, 151, 151), width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(25.0))
                ),
            enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Color.fromARGB(255, 180, 151, 151), width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(25.0))
                ),
            labelText: 'Password', 
            labelStyle: TextStyle(color:Color.fromARGB(255, 180, 151, 151))
         ),
          
        ),
      ),
      Positioned(
      right:10,
      left:10,
      top: 315,

        child:
          Center(
           child: ElevatedButton(
              child: const Text('Login',style: TextStyle(fontSize: 16.0)),
               style: ButtonStyle(
                backgroundColor:  MaterialStateProperty.all<Color>(const Color.fromARGB(255, 130, 67, 130)),
              ),
                onPressed: () {
                  
                },
      ))),
      Positioned(
      right:10,
      left:10,
      top:400,

        child:TextButton(
         onPressed: () {
          //forgot password screen
        },
        child: const Text(
          'Forgot Password?',
        ),
      ),),
      Positioned(
      right:10,
      left:10,
      top:425,
       child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           const Text('Do not have an account?',
            style:TextStyle(color:Color.fromARGB(219, 81, 163, 201))),
           TextButton(
            child: const Text(
              'Sign up',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              //signup screen
            },
          )
        ],
      ),
      )
    ])
    );
  }
}
