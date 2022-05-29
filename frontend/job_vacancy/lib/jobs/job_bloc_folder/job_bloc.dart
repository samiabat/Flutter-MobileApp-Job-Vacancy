import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_vacancy/jobs/job_bloc_folder/job_event.dart';
import 'package:job_vacancy/jobs/job_bloc_folder/job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState>{
  JobBloc(super.initialState);
  
}
