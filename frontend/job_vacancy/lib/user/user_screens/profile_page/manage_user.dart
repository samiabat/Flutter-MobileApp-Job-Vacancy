import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_bloc.dart';
import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_state.dart';
import 'package:job_vacancy/user/user_models/registeration_request.dart';

class ManageUserpage extends StatefulWidget {
  const ManageUserpage({Key? key}) : super(key: key);

  @override
  State<ManageUserpage> createState() => _ManageUserpageState();
}

class _ManageUserpageState extends State<ManageUserpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Manage Users")),
        actions: [
          IconButton(
            onPressed: () => GoRouter.of(context).goNamed("add_update"),
            icon: const Icon(
              Icons.add_circle,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () => GoRouter.of(context).goNamed("register"),
            icon: const Icon(
              Icons.add_circle,
              size: 35,
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoadSuccess) {
                final users = state.users;
                return buildPageWithData(users);
              }
              if (state is UserLoadFailure) {
                return buildFailure();
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget buildPageWithData(List<RegisterRequestModel> users) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: users.length,
      itemBuilder: (context, index) {
        return box(users[index]);
      },
    );
  }

  Widget box(RegisterRequestModel users) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: ListTile(
          title: GestureDetector(
            onTap: () {},
            child: Text(users.username!,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          leading: const Icon(
            Icons.person,
            color: Colors.black,
          ),
          trailing: const Icon(Icons.delete, color: Colors.red),
        ),
      ),
    );
  }

  Widget buildFailure() {
    return const Text("Fail to load");
  }
}
