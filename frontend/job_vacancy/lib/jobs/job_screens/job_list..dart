import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_vacancy/jobs/job_bloc_folder/job_bloc_export.dart';
import 'package:http/http.dart' as http;

import '../job_data_provider/job_data.dart';
import '../job_repository/job_repository.dart';

class JobsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final JobRepository jobRepository = JobRepository(
      dataProvider: JobDataProvider(
        httpClient: http.Client(),
      ),
    );
    final _jobBloc = JobBloc(jobRepository: jobRepository);
    return Scaffold(
      body: BlocBuilder<JobBloc, JobState>(
        bloc: _jobBloc,
        builder: (context, state) {
          print(state);
          print("object");
          if (state is JobLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is JobLoadSuccess) {
            final jobs = state.jobs;
            return Text('$jobs');
          }
          return const Text("Not get any");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _jobBloc.mapEventToState(const JobLoad()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
