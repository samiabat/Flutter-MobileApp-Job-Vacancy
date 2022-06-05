import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_vacancy/user/user_data_provider/user_data_provider.dart';
import 'package:job_vacancy/user/user_models/registeration_request.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class RegisterPage extends StatefulWidget {
  bool isEdit;
  RegisterPage({Key? key, this.isEdit = false}) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  late String username;
  late String email;
  late String password;
  late String repeatPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
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
                        initialValue: "",
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
                              UserDataProvider().register(model).then(
                                (response) {
                                  if (response.statusCode == 201) {
                                    // BlocProvider.of<UserBloc>(context)
                                    //     .add(UserRegister(model));
                                    context.goNamed("login");
                                  } else {
                                    FormHelper.showSimpleAlertDialog(
                                      context,
                                      "Invalid data",
                                      response.message,
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
                                "Invalid data",
                                "Register failed",
                                "OK",
                                () {
                                  Navigator.of(context).pop();
                                },
                              );
                            }
                          }
                        },
                        child: const Text('Register'),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Do you have account?"),
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
                        onPressed: () => context.goNamed("login"),
                        child: const Text("Sign In"))
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
