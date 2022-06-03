import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_vacancy/user/user_screens/companies.dart';
import 'package:job_vacancy/user/user_screens/jobs.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () => GoRouter.of(context).goNamed("splash"),
            icon: const Icon(Icons.home_filled),
          ),
        ],
      ),
      body: Column(
        children: [
          const SafeArea(child: MyHorizone()),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(children: const [
              widget4(),
              Widget1(),
              Widget2(),
              Widget3(),
              widget4(),
              Widget1(),
              Widget2(),
              Widget3(),
              widget4(),
              Widget1(),
              Widget2(),
              Widget3(),
              widget4(),
              Widget1(),
              Widget2(),
              Widget3(),
            ]),
          ),
        ],
      ),
    );
  }

  //padding: EdgeInsets.fromLTRB(15, 140, 15, 10),

}
