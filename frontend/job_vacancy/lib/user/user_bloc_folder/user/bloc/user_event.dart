import 'package:equatable/equatable.dart';
import 'package:job_vacancy/user/user_models/login_request_model.dart';
import 'package:job_vacancy/user/user_models/registeration_request.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserLogging extends UserEvent {
  @override
  List<Object> get props => [];
}

class UserLoad extends UserEvent {
  @override
  List<Object> get props => [];
}

class UserLogin extends UserEvent {
  final LoginRequestModel user;

  const UserLogin(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Job Created {user: $user}';
}

class UserRegister extends UserEvent {
  final RegisterRequestModel user;

  const UserRegister(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Created {user: $user}';
}

class AccountUpdate extends UserEvent {
  final RegisterRequestModel user;

  const AccountUpdate(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Updated {user: $user}';
}

class UserLogout extends UserEvent {
  @override
  List<Object?> get props => [];

  @override
  String toString() => 'User logout';
}

class AccountDelete extends UserEvent {
  final String id;

  const AccountDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'User Deleted {user: $id}';
}

class DeleteByUsername extends UserEvent {
  final String username;

  const DeleteByUsername(this.username);

  @override
  List<Object> get props => [username];

  @override
  toString() => 'User Deleted {usename: $username}';
}

class UserLoadById extends UserEvent {
  final String id;
  const UserLoadById(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'User Loaded {user: $id}';
}
