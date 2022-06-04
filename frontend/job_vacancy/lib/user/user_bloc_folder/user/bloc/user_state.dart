import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {}

class UserLogggedInSuccess extends UserState {
  final String token;

  const UserLogggedInSuccess([this.token = ""]);

  @override
  List<Object> get props => [token];
}

class UserLogggedInFailure extends UserState {}

class UserRegisterSuccess extends UserState {}

class UserRegisterFailure extends UserState {}
