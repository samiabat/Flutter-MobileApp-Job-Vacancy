import 'package:job_vacancy/jobs/job_data_provider/job_data_provider.dart';

import '../job_models/job_model.dart';


class JobRepository {
  final JobDataProvider dataProvider;

  JobRepository({required this.dataProvider}) : assert(dataProvider != null);

  Future<Job> createJob(Job job) async {
    return await dataProvider.createJob(job);
  }

  Future<List<Job>> getJobs() async {
    return await dataProvider.getJobs();
  }

  Future<void> updateJob(Job job) async {
    await dataProvider.updateJob(job);
  }

  Future<void> deleteJob(String id) async {
    await dataProvider.deleteJob(id);
  }
}
