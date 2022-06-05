import 'package:flutter/material.dart';
import 'package:job_vacancy/user/user_models/registeration_request.dart';

class Widget1 extends StatelessWidget {
  final RegisterRequestModel user;
  const Widget1({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: ListTile(
          title: Text(user.username ?? "no user name data",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          leading: const Icon(
            Icons.delete,
            color: Color.fromARGB(255, 243, 33, 33),
          ),
          subtitle: Text(user.email ?? "No email data"),
        ),
      ),
    );
  }
}
