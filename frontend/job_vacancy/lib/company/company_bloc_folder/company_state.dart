import 'package:equatable/equatable.dart';

import '../company.dart';

class CompanyState extends Equatable {
  const CompanyState();

  @override
  List<Object> get props => [];
}

class CompanyLoading extends CompanyState {}

class CompanyLoadSuccess extends CompanyState {
  final List<Company> companies;

  CompanyLoadSuccess([this.companies = const []]);

  @override
  List<Object> get props => [companies];
}

class CompanyOperationFailure extends CompanyState {}
