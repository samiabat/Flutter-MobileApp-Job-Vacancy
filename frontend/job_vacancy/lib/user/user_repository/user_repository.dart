import 'package:job_vacancy/user/user_data_provider/user_data_provider.dart';
import 'package:job_vacancy/user/user_models/user_register.dart';

class UserRepository {
  final UserDataProvider dataProvider;

  UserRepository({required this.dataProvider}) : assert(dataProvider != null);

  // Future<RegisterRequestModel> createUser(RegisterRequestModel user) async {
  //   return await dataProvider.register(user);
  // }

  Future<void> updateUser(RegisterRequestModel user) async {
    await dataProvider.updateUser(user);
  }

  // Future<void> login(loginRequestModel user) async {
  //   await dataProvider.login(user);
  // }

  Future<void> deleteAccount(String id) async {
    await dataProvider.deleteAccount(id);
  }
}
