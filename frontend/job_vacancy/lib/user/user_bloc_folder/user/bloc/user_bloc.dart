import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_event.dart';
import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_state.dart';
import 'package:job_vacancy/user/user_data_provider/user_data_provider.dart';
import 'package:job_vacancy/user/user_repository/user_repository_export.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserLoading()) {
    on<UserLogging>((event, emit) {
      emit(UserLoading());
    });
    on<UserLogin>((event, emit) async {
      try {
        final userData = await userRepository.login(event.user);
        await userRepository.getProfile();
        emit(UserLogggedInSuccess());
      } catch (_) {
        emit(UserLogggedInFailure());
      }
    });

    on<AccountDelete>((event, emit) async {
      await userRepository.deleteAccount(event.id);
    });
    on<UserLoadById>((event, emit) async {
      try {
        final userData = await userRepository.userById(event.id);
        await userRepository.getProfile();
        emit(UserLoadedById());
      } catch (_) {
        emit(UserLoadFailure());
      }
    });

    on<UserLoad>((event, emit) async {
      try {
        final userData = await userRepository.getUsers();
        emit(UserLoadSuccess(userData));
      } catch (_) {
        emit(UserLoadFailure());
      }
    });

    on<UserLogout>((event, emit) async {
      await userRepository.logout();
      emit(UserLoading());
    });
    on<UserRegister>((event, emit) async {
      final userData = await userRepository.createUser(event.user);
      emit(UserRegisterSuccess());
    });
  }
}
