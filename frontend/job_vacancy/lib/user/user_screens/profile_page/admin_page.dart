import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_bloc.dart';
import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_event.dart';
import 'package:job_vacancy/user/user_data_provider/route_controller.dart';

class Admin extends StatelessWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin page'),
        centerTitle: true,
        elevation: 12.0,
        actions: [
          IconButton(
              onPressed: () => GoRouter.of(context).goNamed("jobs"),
              icon: const Icon(Icons.arrow_drop_down_circle_outlined))
        ],
      ),
      drawer: const AdminPage(),
      body: Container(
        child: const Text(
          'welcome to admin page',
          style: TextStyle(fontSize: 48),
        ),
      ),
    );
  }
}

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 160,
              decoration: const BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/c.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  ListTile(
                    dense: true,
                    title: const Text(
                      "Profile",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: const Icon(Icons.home),
                    onTap: () => context.goNamed('profile'),
                  ),
                  ListTile(
                    title: const Text(
                      "Add Job",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: const Icon(Icons.notifications),
                    onTap: () => context.goNamed('add_update'),
                  ),
                  ListTile(
                    title: const Text(
                      "MyCompanies",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: const Icon(Icons.notifications),
                    onTap: () => context.goNamed('companies'),
                  ),
                  ListTile(
                    title: const Text(
                      "Jobs Applied",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: const Icon(Icons.notifications),
                    onTap: () => context.goNamed('jobs'),
                  ),
                  ListTile(
                    dense: true,
                    title: const Text(
                      "ManageUser",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: const Icon(Icons.person),
                    onTap: () {
                      if (loginInfo.getrole) {
                        BlocProvider.of<UserBloc>(context).add(UserLoad());
                        context.goNamed("manageuser");
                      } else {}
                    },
                  ),
                  ListTile(
                    dense: true,
                    title: const Text(
                      "Logout",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: const Icon(Icons.logout),
                    onTap: () async {
                      loginInfo.logout();
                      // BlocProvider.of<UserBloc>(context).add(UserLogout());
                      context.goNamed("login");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
