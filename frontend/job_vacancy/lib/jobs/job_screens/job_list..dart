import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_vacancy/jobs/job_bloc_folder/job_bloc.dart';
import 'package:job_vacancy/jobs/job_bloc_folder/job_state.dart';

class JobsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Courses'),
      ),
      body: BlocBuilder<JobBloc, JobState>(
        builder: (context, state) {
          if (state is JobOperationFailure) {
            return const Text('Could not do course operation');
          }

          if (state is JobLoadSuccess) {
            final jobs = state.jobs;

            return ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (_, idx) => ListTile(
                title: Text('${jobs[idx].title}'),
                subtitle: Text('${jobs[idx].description}'),
                // onTap: () => Navigator.of(context)
                //     .pushNamed(CourseDetail.routeName, arguments: courses[idx]),
              ),
            );
          }

          return const CircularProgressIndicator();
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.of(context).pushNamed(
      //     AddUpdateCourse.routeName,
      //     arguments: CourseArgument(edit: false),
      //   ),
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
