import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_vacancy/login_info.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.person,
                  size: 42,
                  color: Colors.amber,
                ),
                Column(
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text("Admin-Page",
                            style:
                                TextStyle(fontSize: 22, color: Colors.amber))),
                    Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text("Admin-Page",
                            style:
                                TextStyle(fontSize: 16, color: Colors.amber))),
                  ],
                )
              ],
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
                    dense: true,
                    title: const Text(
                      "ManageUser",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: const Icon(Icons.person),
                    onTap: () => context.goNamed('manageuser'),
                  ),
                  ListTile(
                    title: const Text(
                      "About",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: const Icon(Icons.notifications),
                    onTap: () => context.goNamed('about'),
                  ),
                  ListTile(
                    dense: true,
                    title: const Text(
                      "Logout",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: const Icon(Icons.logout),
                    onTap: () async {
                      LoginInfo().logout();
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
