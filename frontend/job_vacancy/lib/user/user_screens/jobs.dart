import 'package:flutter/material.dart';
import 'package:job_vacancy/jobs/job_models/job_model.dart';

class Widget1 extends StatelessWidget {
  final Job job;
  const Widget1({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: ListTile(
          title: Text(job.title,
              style: const TextStyle(fontWeight: FontWeight.bold)),
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
