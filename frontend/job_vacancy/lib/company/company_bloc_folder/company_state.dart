import 'package:equatable/equatable.dart';
import 'package:job_vacancy/company/company_models/company_model.dart';

class CompanyState extends Equatable {
  const CompanyState();

  @override
  List<Object> get props => [];
}

class CompanyLoading extends CompanyState {}

class CompanyLoadSuccess extends CompanyState {
  final List<Company> companies;

  const CompanyLoadSuccess([this.companies = const []]);

  @override
  List<Object> get props => [companies];
}

class CompanyOperationFailure extends CompanyState {}
