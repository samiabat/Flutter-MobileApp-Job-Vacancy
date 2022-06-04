import 'package:bloc_test/bloc_test.dart';
import 'package:http/http.dart';
import 'package:job_vacancy/jobs/job_bloc_folder/job_bloc_export.dart';
import 'package:job_vacancy/jobs/job_data_provider/job_data_provider.dart';
import 'package:job_vacancy/jobs/job_repository/job_repository_export.dart';
import 'package:test/test.dart';

void main() {
  JobRepository jobRepository = JobRepository(
    dataProvider: JobDataProvider(
      httpClient: Client(),
    ),
  );
  group("Job unit test", () {
    blocTest<JobBloc, JobState>(
      "Emit [JobLoadSuccess]",
      build: () => JobBloc(jobRepository: jobRepository),
      act: (bloc) => bloc.add(const JobLoad()),
      expect: () => JobLoading(),
    );
  });
}
