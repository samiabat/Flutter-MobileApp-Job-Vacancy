import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Hello page1"),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GoRouter.of(context).goNamed("jobs"),
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}
