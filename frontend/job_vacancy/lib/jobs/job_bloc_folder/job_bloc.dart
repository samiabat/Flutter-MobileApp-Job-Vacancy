import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_vacancy/jobs/job_bloc_folder/job_event.dart';
import 'package:job_vacancy/jobs/job_bloc_folder/job_state.dart';
import 'package:job_vacancy/jobs/job_repository/job_repository.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final JobRepository jobRepository;
  JobBloc({required this.jobRepository}) : super(JobLoading());

  @override
  Stream<JobState> mapEventState(JobEvent event) async* {
    if (event is JobLoad) {
      yield JobLoading();
      try {
        final jobs = await jobRepository.getJobs();
        yield JobLoadSuccess();
      } catch (_) {
        yield JobOperationFailure();
      }
    }
    if (event is JobCreate) {
      try {
        await jobRepository.createJob(event.job);
        final responce = await jobRepository.getJobs();
        yield JobLoadSuccess(responce);
      } catch (_) {
        yield JobOperationFailure();
      }
    }
    if (event is JobUpdate) {
      try {
        await jobRepository.updateJob(event.job);
        final responce = await jobRepository.getJobs();
        yield JobLoadSuccess(responce);
      } catch (_) {
        yield JobOperationFailure();
      }
    }

    if (event is JobDelete) {
      try {
        await jobRepository.deleteJob(event.id);
        final responce = await jobRepository.getJobs();
        yield JobLoadSuccess(responce);
      } catch (_) {
        JobOperationFailure();
      }
    }
  }
}
