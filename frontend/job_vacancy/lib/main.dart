import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './page/profile_page.dart';

void main(){
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddUpdateJob(),
    );
  }
}
