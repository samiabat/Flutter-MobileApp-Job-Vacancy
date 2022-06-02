import 'package:flutter/material.dart';
import 'package:job_vacancy/user/user_screens/cards.dart';

class MyHorizone extends StatelessWidget {
  const MyHorizone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              Card1(),
              Card2(),
              Card3(),
              Card1(),
              Card2(),
              Card3(),
              Card1(),
              Card2(),
              Card3(),
              Card1(),
              Card2(),
              Card3()
            ],
          ),
        ),
      ),
    );
  }
}
