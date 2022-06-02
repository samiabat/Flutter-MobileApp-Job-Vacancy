import 'package:flutter/material.dart';

import '../job_models/job.dart';

class JobDetail extends StatelessWidget {
  final Future<Job> job;
  const JobDetail({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Job Detail")),
      ),
      body: FutureBuilder<Job>(
          future: getJob(),
          builder: (context, snapshot) {
            var job = snapshot.data;
            return Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: job != null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(job.title),
                              subtitle: Column(
                                children: [
                                  Text(job.description),
                                  Text("job posted ${job.date_created}"),
                                  Text("job updated on ${job.date_updated}"),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text("apply"),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const Text("woops no job!"),
                  )
                ],
              ),
            );
          }),
    );
  }

  Future<Job> getJob() async {
    return await job;
  }
}