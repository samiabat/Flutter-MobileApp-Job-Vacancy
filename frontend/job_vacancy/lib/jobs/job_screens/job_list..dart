import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_vacancy/jobs/job_bloc_folder/job_bloc_export.dart';
import 'package:job_vacancy/jobs/job_models/job.dart';

class JobsList extends StatefulWidget {
  @override
  State<JobsList> createState() => _JobsListState();
}

class _JobsListState extends State<JobsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("List of jobs")),
        actions: [
          IconButton(
            onPressed: () => GoRouter.of(context).goNamed("home"),
            icon: const Icon(
              Icons.home,
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: BlocBuilder<JobBloc, JobState>(
            builder: (context, state) {
              if (state is JobLoadSuccess) {
                final jobs = state.jobs;
                return buildPageWithData(jobs);
              }
              if (state is JobOperationFailure) {
                return buildFailure();
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget buildPageWithData(List<Job> jobs) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        return box(jobs[index]);
      },
    );
  }

  Widget box(Job job) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: ListTile(
          title: GestureDetector(
            onTap: () =>
                context.goNamed('details', params: {"id": job.id.toString()}),
            child: Text(job.title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
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

  Widget buildFailure() {
    return const Text("Fail to load");
  }
}
