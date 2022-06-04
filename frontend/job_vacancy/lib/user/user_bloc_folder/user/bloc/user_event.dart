import 'package:equatable/equatable.dart';
import 'package:job_vacancy/user/user_models/user_register.dart';


abstract class UserEvent extends Equatable {
  const UserEvent();
}

class Loggedin extends UserEvent {
  const Loggedin();

  @override
  List<Object> get props => [];
}

class UserRegister extends UserEvent {
  final RegisterRequestModel user;

  const UserRegister(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Created {course: $user}';
}

class AccountUpdate extends UserEvent {
  final RegisterRequestModel user;

  const AccountUpdate(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Updated {course: $user}';
}

class AccountDelete extends UserEvent {
  final String id;

  const AccountDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'User Deleted {course: $id}';
}
