
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_event.dart';
// import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_state.dart';
// import 'package:job_vacancy/user/user_repository/user_repository_export.dart';

// class UserBloc extends Bloc<UserEvent, UserState> {
//   final UserRepository userRepository;
//   UserBloc({required this.userRepository}) : super(UserLoading()) {
//     on<Loggedin>((event, emit) async {
//       try {
//         final userData = await userRepository.login(state.props);
//         emit();
//       } catch (_) {
//         emit(JobOperationFailure());
//       }
//     });
//   }
// }