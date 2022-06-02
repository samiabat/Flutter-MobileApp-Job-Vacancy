import 'package:flutter/material.dart';
import 'listmodel.dart';

void main() {
  runApp(const MyApp());
}


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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:const  Color.fromARGB(255, 179, 174, 174),
        body: Column(
          children: [
           const  SizedBox(height: 75),
            
                 Container(
               padding: const EdgeInsets.only(left:20.0),

                height: 50,
                child:
                const Icon(Icons.menu)),
             const Padding(
                 padding: EdgeInsets.only( left: 20.0),
                 child: 
               Text('Companies',
                   // textAlign: TextAlign.start,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),

            Container(
                height: 200,
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: horizontal.length,
                    itemBuilder: (BuildContext context, int index) {
                      final list = horizontal[index];
                      return Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            width: 200,
                              color: Colors.black,
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                         Icon(list.icon1[index],color:list.color1[index],
                                         )],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                      Column(children: [
                                        Text(list.company,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        Text(list.field,
                                            style:
                                               const TextStyle(color: Colors.green))
                                      ]),
                                    ])
                                  ])));
                    })),
           const SizedBox(
              height: 60,
              
            ),
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: vertical.length,
                    itemBuilder: (BuildContext context, int index) {
                      final list2 = vertical[index];
                      return Container(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Column(children: [
                            Card(
                                child: ListTile(
                              title: Text(list2.job,
                                  style:
                                      const TextStyle(fontWeight: FontWeight.bold)),
                              leading: Icon(list2.icon2[index],color: list2.color2[index]),
                              subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(list2.text1),
                                    Text(list2.text2),
                                    ElevatedButton(
                                      child: const Text(
                                        'Apply', /*style: TextStyle(fontSize: 16.0)*/
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                               const  Color.fromARGB(
                                                    255, 18, 111, 135)),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ]),
                            )),
                          ]));
                    }))
          ],
        ));
  }
}
