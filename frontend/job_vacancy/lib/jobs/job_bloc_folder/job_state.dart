import 'package:equatable/equatable.dart';

import '../job_models/job_model.dart';

class JobState extends Equatable {
  const JobState();

  @override
  List<Object> get props => [];
}

class JobLoading extends JobState {}

class JobLoadSuccess extends JobState {
  final List<Job> jobs;

  const JobLoadSuccess([this.jobs = const []]);

  @override
  List<Object> get props => [jobs];
}

class JobOperationFailure extends JobState {}
