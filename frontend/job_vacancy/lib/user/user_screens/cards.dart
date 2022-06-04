import 'package:flutter/material.dart';
import 'package:job_vacancy/jobs/job_models/job_model.dart';

class CustomCard extends StatelessWidget {
  final Job job;
  const CustomCard({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 160,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black,
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.wifi, color: Color.fromARGB(255, 33, 212, 243)),
              Column(
                children: [
                  Text(job.title.split(" ")[0],
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  const Text('Manager', style: TextStyle(color: Colors.green)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
