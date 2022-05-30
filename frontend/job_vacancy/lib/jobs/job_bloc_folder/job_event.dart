import 'package:equatable/equatable.dart';
import 'package:job_vacancy/jobs/job_models/job.dart';

abstract class JobEvent extends Equatable {
  const JobEvent();
}

class JobLoad extends JobEvent {
  const JobLoad();

  @override
  List<Object> get props => [];
}

class JobCreate extends JobEvent {
  final Job job;

  const JobCreate(this.job);

  @override
  List<Object> get props => [job];

  @override
  String toString() => 'Job Created {course: $job}';
}

class JobUpdate extends JobEvent {
  final Job job;

  const JobUpdate(this.job);

  @override
  List<Object> get props => [job];

  @override
  String toString() => 'Job Updated {course: $job}';
}

class JobDelete extends JobEvent {
  final String id;

  const JobDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Job Deleted {course: $id}';
}
