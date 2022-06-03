import 'package:flutter_bloc/flutter_bloc.dart';

import '../company_repository/company_repository.dart';
import 'company_bloc_export.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final CompanyRepository companyRepository;

  CompanyBloc({required this.companyRepository}) : super(CompanyLoading()) {
    on<CompanyLoad>((event, emit) async {
      emit(CompanyLoading());
      try {
        final companies = await companyRepository.getCompanies();
        emit(CompanyLoadSuccess(companies));
      } catch (_) {
        emit(CompanyOperationFailure());
      }
    });
    // on<CompanyCreate>((event, emit) async{
    //   try {
    //     await jobRepository.createJob(event.job);
    //     final responce = await jobRepository.getJobs();
    //     yield JobLoadSuccess(responce);
    //   } catch (_) {
    //     yield JobOperationFailure();
    //   }
    // });

    // on<Job>
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
