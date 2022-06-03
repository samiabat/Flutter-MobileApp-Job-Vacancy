import 'package:flutter/material.dart';

class Widget1 extends StatelessWidget {
  const Widget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: ListTile(
          title: const Text("Electr",
              style: TextStyle(fontWeight: FontWeight.bold)),
          leading: const Icon(
            Icons.add,
            color: Color.fromARGB(255, 243, 33, 33),
          ),
          subtitle:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            const Text('contact'),
            const Text('Full time'),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 18, 111, 135)),
              ),
              onPressed: () {},
              child: const Text(
                'Apply', /*style: TextStyle(fontSize: 16.0)*/
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class Widget2 extends StatelessWidget {
  const Widget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: ListTile(
          title: const Text("Marketo",
              style: TextStyle(fontWeight: FontWeight.bold)),
          leading: const Icon(
            Icons.add,
            color: Color.fromARGB(255, 243, 33, 33),
          ),
          subtitle: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('contact'),
                const Text('Full time'),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 18, 111, 135)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Apply', /*style: TextStyle(fontSize: 16.0)*/
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Widget3 extends StatelessWidget {
  const Widget3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: ListTile(
          title: const Text('Lead UI Designer',
              style: TextStyle(fontWeight: FontWeight.bold)),
          leading: const Icon(
            Icons.star_half_rounded,
            color: Color.fromARGB(255, 37, 5, 5),
          ),
          subtitle: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: const Text(
                      " hello every body here is sami doing the greate thing to the peoplse"),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('contact'),
                      const Text('Full time'),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 18, 111, 135)),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Apply', /*style: TextStyle(fontSize: 16.0)*/
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class widget4 extends StatelessWidget {
  const widget4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: ListTile(
          title: const Text("Electrician",
              style: TextStyle(fontWeight: FontWeight.bold)),
          leading: const Icon(
            Icons.add,
            color: Color.fromARGB(255, 243, 33, 33),
          ),
          subtitle: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('contact'),
                const Text('Full time'),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 18, 111, 135)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Apply', /*style: TextStyle(fontSize: 16.0)*/
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
