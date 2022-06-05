import 'package:job_vacancy/user/user_data_provider/user_data_provider.dart';
import 'package:job_vacancy/user/user_models/login_request_model.dart';
import 'package:job_vacancy/user/user_models/registeration_request.dart';
import 'package:job_vacancy/user/user_models/registeration_response.dart';

class UserRepository {
  final UserDataProvider dataProvider;

  UserRepository({required this.dataProvider});

  Future<RegisterResponseModel> createUser(RegisterRequestModel user) async {
    return await dataProvider.register(user);
  }

  Future<void> updateUser(RegisterRequestModel user) async {
    await dataProvider.updateUser(user);
  }

  Future<void> login(LoginRequestModel user) async {
    await dataProvider.login(user);
  }

  Future<List<RegisterRequestModel>> getUsers() async {
    return await dataProvider.getUsers();
  }

  Future<void> getProfile() async {
    await dataProvider.getProfile();
  }

  Future<RegisterRequestModel> userById(String? id) async {
    return await dataProvider.userById(id);
  }

  Future<void> deleteByUsername(String? username) async {
    return await dataProvider.deleteByUsername(username!);
  }

  Future<void> logout() async {
    await dataProvider.logout();
  }

  Future<void> deleteAccount(String id) async {
    await dataProvider.deleteAccount(id);
  }
}
