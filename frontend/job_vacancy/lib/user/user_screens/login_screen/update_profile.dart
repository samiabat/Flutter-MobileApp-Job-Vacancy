import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_bloc.dart';
import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_event.dart';
import 'package:job_vacancy/user/user_data_provider/route_controller.dart';
import 'package:job_vacancy/user/user_models/registeration_request.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class UpdateProfilePage extends StatefulWidget {
  bool isEdit;
  UpdateProfilePage({Key? key, this.isEdit = false}) : super(key: key);

  @override
  UpdateProfilePageState createState() => UpdateProfilePageState();
}

class UpdateProfilePageState extends State<UpdateProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late String username;
  late String email;
  late String password;
  late String repeatPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UpdateProfile"),
        actions: [
          IconButton(
              onPressed: () {
                context.goNamed("home");
              },
              icon: const Icon(Icons.home))
        ],
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
                        initialValue: loginInfo.getusername,
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
                            username = value!;
                          });
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        initialValue: loginInfo.getemail,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: 'email',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          setState(() {
                            email = value!;
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
                            password = value!;
                          });
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter repeatpassword!';
                          }
                          try {
                            if (!(password == value)) {
                              return 'Password mismach!';
                            }
                          } catch (_) {}
                          return null;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          labelText: 'repeatpassword',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          setState(() {
                            repeatPassword = value!;
                          });
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          final form = _formKey.currentState;
                          if (validateAndSave()) {
                            try {
                              RegisterRequestModel model = RegisterRequestModel(
                                  username: username,
                                  email: email,
                                  password: password,
                                  repeatPassword: repeatPassword);

                              BlocProvider.of<UserBloc>(context)
                                  .add(AccountUpdate(model));
                              context.goNamed("home");
                            } catch (_) {}
                          }
                        },
                        child: const Text('UpdateProfile'),
                      ),
                    ),
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
