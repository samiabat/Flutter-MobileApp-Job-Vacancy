import 'package:equatable/equatable.dart';
import 'package:job_vacancy/user/user_models/registeration_request.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {}

class UserLogggedInSuccess extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedById extends UserState {}

class UserLoadSuccess extends UserState {
  final List<RegisterRequestModel> users;

  const UserLoadSuccess([this.users = const []]);

  @override
  List<Object> get props => [users];
}

class UserLoadFailure extends UserState {}

class UserLogoutSuccess extends UserState {}

class UserLogggedInFailure extends UserState {}

class UserRegisterSuccess extends UserState {}

class UserRegisterFailure extends UserState {}
