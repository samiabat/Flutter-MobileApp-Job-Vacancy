import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_vacancy/jobs/job_bloc_folder/job_bloc_export.dart';
import 'package:job_vacancy/jobs/job_repository/job_repository_export.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final JobRepository jobRepository;
  JobBloc({required this.jobReposito  ry}) : super(JobLoading()) {
    
    on<JobLoad>((event, emit) async {
      emit(JobLoading());
      try {
        final jobs = await jobRepository.getJobs();
        emit(JobLoadSuccess(jobs));
      } catch (_) {
        emit(JobOperationFailure());
      }
    });
    on<JobCreate>((event, emit) async {
      try {
        await jobRepository.createJob(event.job);
        final responce = await jobRepository.getJobs();
        emit(JobLoadSuccess(responce));
      } catch (_) {
        emit(JobOperationFailure());
      }
    });

    on<JobDelete>((event, emit) async {
      try {
        await jobRepository.deleteJob(event.id);
        final responce = await jobRepository.getJobs();
        emit(JobLoadSuccess(responce));
      } catch (_) {
        JobOperationFailure();
      }
    });
  }
}


//   Stream<JobState> mapEventToState(JobEvent event) async* {
//     if (event is JobLoad) {
//       yield JobLoading();
//       try {
//         final jobs = await jobRepository.getJobs();
//         yield JobLoadSuccess();
//       } catch (_) {
//         yield JobOperationFailure();
//       }
//     }
//     if (event is JobCreate) {
//       try {
//         await jobRepository.createJob(event.job);
//         final responce = await jobRepository.getJobs();
//         yield JobLoadSuccess(responce);
//       } catch (_) {
//         yield JobOperationFailure();
//       }
//     }
//     if (event is JobUpdate) {
//       try {
//         await jobRepository.updateJob(event.job);
//         final responce = await jobRepository.getJobs();
//         yield JobLoadSuccess(responce);
//       } catch (_) {
//         yield JobOperationFailure();
//       }
//     }

//     if (event is JobDelete) {
//       try {
//         await jobRepository.deleteJob(event.id);
//         final responce = await jobRepository.getJobs();
//         yield JobLoadSuccess(responce);
//       } catch (_) {
//         JobOperationFailure();
//       }
//     }
//   }
// }
