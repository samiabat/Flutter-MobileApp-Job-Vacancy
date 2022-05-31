import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../job_bloc_folder/job_bloc.dart';
import '../job_models/job.dart';

class JobDetail extends StatelessWidget {
  JobDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final job = BlocProvider.of<JobBloc>(context).jobRepository.getJobs();
    return Scaffold(
      body: Container(
        child: Text('${job}'),
      ),
    );
  }
}
