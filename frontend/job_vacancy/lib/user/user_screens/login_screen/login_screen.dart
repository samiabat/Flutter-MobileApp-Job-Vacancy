// import 'package:flutter/material.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   static const String _title = 'Sample App';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       debugShowCheckedModeBanner: false,
//       home: LoginState(),
//     );
//   }
// }

// class LoginState extends StatefulWidget {
//   const LoginState({Key? key}) : super(key: key);

//   @override
//   State<LoginState> createState() => _LoginStateState();
// }

// class _LoginStateState extends State<LoginState> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(children: [
//       Container(
//         color: const Color.fromARGB(213, 240, 236, 236),
//       ),
//       Positioned(
//           right: MediaQuery.of(context).size.height / 14,
//           left: MediaQuery.of(context).size.height / 14,
//           top: MediaQuery.of(context).size.height / 14,
//           child: Container(
//               height: MediaQuery.of(context).size.height / 2,
//               width: MediaQuery.of(context).size.width,
//               child: ClipRRect(
//                 child: Image.asset("assets/c.png"),
//               ))),
//       Positioned(
//         right: 65,
//         left: 65,
//         top: 270,
//         child: TextField(
//           controller: nameController,
//           decoration: const InputDecoration(
//             focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
//             enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
//             labelText: 'Enter your email ',
//           ),
//         ),
//       ),
//       Positioned(
//         right: 65,
//         left: 65,
//         top: 350,
//         child: TextField(
//           obscureText: true,
//           controller: passwordController,
//           decoration: const InputDecoration(
//             focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
//             enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
//             labelText: 'Enter password',
//           ),
//         ),
//       ),
//       Positioned(
//           right: 65,
//           left: 65,
//           top: 430,
//           child: ElevatedButton(
//             style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all<Color>(
//                   const Color.fromARGB(187, 11, 168, 241)),
//             ),
//             onPressed: () {},
//             child: const Text(
//               'Login',
//               style: TextStyle(color: Colors.black, fontSize: 16.0),
//             ),
//           )),
//       Positioned(
//         right: 65,
//         left: 65,
//         top: 500,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('Not registered yet?',
//                 style: TextStyle(color: Color.fromARGB(255, 48, 47, 47))),
//             TextButton(
//               child: const Text(
//                 'Create account',
//                 style: TextStyle(fontSize: 16, color: Colors.black),
//               ),
//               onPressed: () {
//                 //signup screen
//               },
//             )
//           ],
//         ),
//       )
//     ]));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_bloc.dart';
import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_event.dart';
import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_state.dart';
import 'package:job_vacancy/user/user_data_provider/user_data_provider.dart';
import 'package:job_vacancy/user/user_models/login_request_model.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late String? username;
  late String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              image: const AssetImage('assets/c.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        initialValue: 'samuel',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'username',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          setState(() {
                            username = value;
                          });
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          labelText: 'password',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          setState(() {
                            password = value;
                          });
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          final form = _formKey.currentState;
                          if (validateAndSave()) {
                            try {
                              LoginRequestModel model = LoginRequestModel(
                                username: username!,
                                password: password!,
                              );
                              UserDataProvider().login(model).then(
                                (response) {
                                  if (response) {
                                    // BlocProvider.of<UserBloc>(context)
                                    //     .add(UserLogin(model));
                                  } else {
                                    FormHelper.showSimpleAlertDialog(
                                      context,
                                      "Wrong password",
                                      "Invalid Username/Password !!",
                                      "OK",
                                      () {
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  }
                                },
                              );
                            } catch (_) {
                              FormHelper.showSimpleAlertDialog(
                                context,
                                "Wrong password",
                                "Invalid Username/Password !!",
                                "OK",
                                () {
                                  Navigator.of(context).pop();
                                },
                              );
                            }
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(187, 11, 168, 241)),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don`t you have account?"),
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text("Forgot password"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () => context.goNamed("register"),
                        child: const Text("Sign Up"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
