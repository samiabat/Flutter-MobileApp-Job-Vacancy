import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_bloc.dart';
import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_event.dart';
import 'package:job_vacancy/user/user_models/registeration_request.dart';

class Profile extends StatelessWidget {
  final Future<RegisterRequestModel> user;
  final Future<String> id;
  Profile({Key? key, required this.user, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Profile")),
      body: FutureBuilder<RegisterRequestModel>(
          future: getUser(),
          builder: (context, snapshot) {
            var user = snapshot.data;
            return Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: user != null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(user.username!),
                              subtitle: Column(
                                children: [
                                  Text(user.email!),
                                  Text("email posted ${user.email}"),
                                  TextButton(
                                    onPressed: () {
                                      getId().then((value) {
                                        BlocProvider.of<UserBloc>(context)
                                            .add(AccountDelete(value));
                                        context.goNamed("login");
                                      });
                                    },
                                    child: const Text("delete account"),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const Text("woops no job!"),
                  )
                ],
              ),
            );
          }),
    );
  }

  Future<RegisterRequestModel> getUser() async {
    return await user;
  }

  Future<String> getId() async {
    return await id;
  }
}
