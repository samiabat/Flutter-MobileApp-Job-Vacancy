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
            image: DecorationImage(image: AssetImage("assets/img2.jpg"), fit: BoxFit.cover)),
      ),
      const Positioned(
      right:65,
      left:65,
      top:115,
      
        child:Text("Register now",
        textAlign: TextAlign.center,
        style:TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black))),
      
      Positioned(
      right:65,
      left:65,
      top:160,
      
        child: TextField(
          style: const TextStyle(color:Color.fromARGB(255, 35, 7, 7)),
          //controller: nameController,
          decoration:  const InputDecoration(
           focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color:Color.fromARGB(255, 35, 7, 7),width:2.0),
                               borderRadius: BorderRadius.all(Radius.circular(25.0))
 ),
          enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 35, 7, 7), width: 2.0),
                               borderRadius: BorderRadius.all(Radius.circular(25.0))
 ),
            labelText: 'First name',
            labelStyle: TextStyle(color:Color.fromARGB(255, 35, 7, 7)         ),
        ),
       ) ),
      
      Positioned(
      right:65,
      left:65,
      top:240,
      
        child: TextField(
          style: const TextStyle(color:Color.fromARGB(255, 35, 7, 7)),
         // controller: nameController,
          decoration:  const InputDecoration(
           focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color:Color.fromARGB(255, 35, 7, 7),width:2.0),
                               borderRadius: BorderRadius.all(Radius.circular(25.0))
 ),
          enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 35, 7, 7), width: 2.0),
                               borderRadius: BorderRadius.all(Radius.circular(25.0))
 ),
            labelText: 'Last name',
            labelStyle: TextStyle(color:Color.fromARGB(255, 35, 7, 7)

          ),
        ),
      ),
      ),
      Positioned(
      right:65,
      left:65,
      top:320,
      
        child: TextField(
          style: const TextStyle(color:Color.fromARGB(255, 35, 7, 7)),
          //controller: nameController,
          decoration:  const InputDecoration(
           focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color:Color.fromARGB(255, 35, 7, 7),width:2.0),
                               borderRadius: BorderRadius.all(Radius.circular(25.0))
 ),
          enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 35, 7, 7), width: 2.0),
                               borderRadius: BorderRadius.all(Radius.circular(25.0))
 ),
            labelText: 'email',
            labelStyle: TextStyle(color:Color.fromARGB(255, 35, 7, 7)

          ),
        ),
      ),
      ),
      Positioned(
      right:65,
      left:65,
      top:400,
    
        child: TextField(
          style: const TextStyle(color:Color.fromARGB(255, 35, 7, 7)),
          obscureText: true,
          controller: passwordController,
          decoration:  const InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color:Color.fromARGB(255, 35, 7, 7), width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(25.0))
                ),
            enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Color.fromARGB(255, 35, 7, 7), width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(25.0))
                ),
            labelText: 'Password', 
            labelStyle: TextStyle(color:Color.fromARGB(255, 35, 7, 7))
         ),
          
        ),
      ),
      Positioned(
      right:10,
      left:10,
      top: 465,

        child:
          Center(
           child: ElevatedButton(
              child: const Text('register',style: TextStyle(fontSize: 16.0)),
               style: ButtonStyle(
                backgroundColor:  MaterialStateProperty.all<Color>(Color.fromARGB(255, 25, 16, 25)),
              ),
                onPressed: () {
                  
                },
      ))),
      
    ])
    );
  }
}
