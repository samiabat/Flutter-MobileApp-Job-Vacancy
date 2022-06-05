import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_vacancy/jobs/job_bloc_folder/job_bloc_export.dart';
import 'package:job_vacancy/jobs/job_models/job_model.dart';
import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_bloc.dart';
import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class AddEditJobPage extends StatefulWidget {
  AddEditJobPage({Key? key}) : super(key: key);

  @override
  State<AddEditJobPage> createState() => _AddEditJobPageState();
}

class _AddEditJobPageState extends State<AddEditJobPage> {
  final _formKey = GlobalKey<FormState>();

  late String? title;
  late String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: BlocListener<UserBloc, UserState>(
          listener: (context, state) {},
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
                          initialValue: '',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter title';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'title',
                            border: OutlineInputBorder(),
                          ),
                          onSaved: (value) {
                            setState(() {
                              title = value;
                            });
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter description! ';
                            }
                            return null;
                          },
                          maxLines: 4,
                          decoration: const InputDecoration(
                            labelText: 'description',
                            border: OutlineInputBorder(),
                          ),
                          onSaved: (value) {
                            setState(() {
                              description = value;
                            });
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            final form = _formKey.currentState;
                            if (validateAndSave()) {
                              getUserId().then((value) {
                                print(value);
                                try {
                                  Job model = Job(
                                    title: title!,
                                    poster: int.parse(value!),
                                    description: description!,
                                  );
                                  BlocProvider.of<JobBloc>(context)
                                      .add(JobCreate(model));
                                  context.goNamed("home");
                                } catch (_) {
                                  FormHelper.showSimpleAlertDialog(
                                    context,
                                    "Invalid data",
                                    "Faild!",
                                    "OK",
                                    () {
                                      Navigator.of(context).pop();
                                    },
                                  );
                                }
                              });
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(187, 11, 168, 241)),
                          ),
                          child: const Text(
                            'Add Job',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SafeArea(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text("Go Home"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () => context.goNamed("home"),
                          child: const Text("Go Back"))
                    ],
                  ),
                ),
              ),
            ],
          ),
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

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString("userid");
    return userId;
  }
}
