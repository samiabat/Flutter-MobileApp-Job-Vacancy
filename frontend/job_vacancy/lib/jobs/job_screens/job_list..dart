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
              onPressed: () => GoRouter.of(context).goNamed("add_update"),
              icon: const Icon(Icons.add_box))
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
          return GestureDetector(
            onTap: () => context
                .goNamed('details', params: {"id": jobs[index].id.toString()}),
            child: ListTile(
              title: Text(jobs[index].title),
              subtitle: Text(jobs[index].description),
            ),
          );
        });
  }

  Widget buildFailure() {
    return const Text("Fail to load");
  }
}
