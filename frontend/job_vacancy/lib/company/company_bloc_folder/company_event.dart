import 'package:equatable/equatable.dart';
import 'package:job_vacancy/company/company_models/company_model.dart';

abstract class CompanyEvent extends Equatable {
  const CompanyEvent();
}

class CompanyLoad extends CompanyEvent {
  const CompanyLoad();

  @override
  List<Object> get props => [];
}

class CompanyCreate extends CompanyEvent {
  final Company company;

  const CompanyCreate(this.company);

  @override
  List<Object> get props => [Company];

  @override
  String toString() => 'Company Created {course: $company}';
}

class CompanyUpdate extends CompanyEvent {
  final Company job;

  const CompanyUpdate(this.job);

  @override
  List<Object> get props => [job];

  @override
  String toString() => 'Company Updated {course: $job}';
}

class CompanyDelete extends CompanyEvent {
  final String id;

  const CompanyDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Company Deleted {course: $id}';
}
