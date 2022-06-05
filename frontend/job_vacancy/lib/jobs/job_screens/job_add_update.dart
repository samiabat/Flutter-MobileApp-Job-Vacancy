// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:job_vacancy/jobs/job_bloc_folder/job_bloc_export.dart';
// import 'package:job_vacancy/jobs/job_models/job.dart';
// import 'package:snippet_coder_utils/FormHelper.dart';
// import 'package:snippet_coder_utils/ProgressHUD.dart';
// import 'package:snippet_coder_utils/hex_color.dart';

// class AddJobPage extends StatefulWidget {
//   const AddJobPage({Key? key}) : super(key: key);

//   @override
//   _AddJobPageState createState() => _AddJobPageState();
// }

// class _AddJobPageState extends State<AddJobPage> {
//   bool isApiCallProcess = false;
//   bool hidePassword = true;
//   GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
//   late int id;
//   late String title;
//   late int poster;
//   late String description;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: HexColor("#283B71"),
//         body: ProgressHUD(
//           inAsyncCall: isApiCallProcess,
//           opacity: 0.3,
//           key: UniqueKey(),
//           child: Form(
//             key: globalFormKey,
//             child: _AddJobUI(context),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _AddJobUI(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height / 5.2,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Colors.white,
//                   Colors.white,
//                 ],
//               ),
//               borderRadius: BorderRadius.only(
//                 //topLeft: Radius.circular(100),
//                 //topRight: Radius.circular(150),
//                 bottomRight: Radius.circular(100),
//                 bottomLeft: Radius.circular(100),
//               ),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const <Widget>[],
//             ),
//           ),
//           Row(
//             children: [
//               const Text(
//                 "AddJob",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25,
//                   color: Colors.white,
//                 ),
//               ),
//               IconButton(
//                   onPressed: () {
//                     BlocProvider.of<JobBloc>(context).add(const JobLoad());
//                     context.goNamed("home");
//                   },
//                   icon: const Icon(Icons.login_sharp))
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10),
//             child: FormHelper.inputFieldWidget(
//               context,
//               "id",
//               "id",
//               (onValidateVal) {
//                 if (onValidateVal.isEmpty) {
//                   return 'title can\'t be empty.';
//                 }

//                 return null;
//               },
//               (onSavedVal) => {
//                 id = int.parse(onSavedVal),
//               },
//               initialValue: "",
//               obscureText: false,
//               borderFocusColor: Colors.white,
//               prefixIconColor: Colors.white,
//               borderColor: Colors.white,
//               textColor: Colors.white,
//               hintColor: Colors.white.withOpacity(0.7),
//               borderRadius: 10,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10),
//             child: FormHelper.inputFieldWidget(
//               context,
//               "title",
//               "title",
//               (onValidateVal) {
//                 if (onValidateVal.isEmpty) {
//                   return 'title can\'t be empty.';
//                 }

//                 return null;
//               },
//               (onSavedVal) => {
//                 title = onSavedVal,
//               },
//               initialValue: "",
//               obscureText: false,
//               borderFocusColor: Colors.white,
//               prefixIconColor: Colors.white,
//               borderColor: Colors.white,
//               textColor: Colors.white,
//               hintColor: Colors.white.withOpacity(0.7),
//               borderRadius: 10,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10),
//             child: FormHelper.inputFieldWidget(
//               context,
//               "poster",
//               "poster",
//               (onValidateVal) {
//                 if (onValidateVal.isEmpty) {
//                   return 'Poster can\'t be empty.';
//                 }

//                 return null;
//               },
//               (onSavedVal) => {
//                 poster = int.parse(onSavedVal),
//               },
//               initialValue: "",
//               borderFocusColor: Colors.white,
//               prefixIconColor: Colors.white,
//               borderColor: Colors.white,
//               textColor: Colors.white,
//               hintColor: Colors.white.withOpacity(0.7),
//               borderRadius: 10,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10),
//             child: FormHelper.inputFieldWidget(
//               context,
//               "description",
//               "description",
//               (onValidateVal) {
//                 if (onValidateVal.isEmpty) {
//                   return 'Please Enter your description can\'t be empty.';
//                 }

//                 return null;
//               },
//               (onSavedVal) => {
//                 description = onSavedVal,
//               },
//               initialValue: "",
//               borderFocusColor: Colors.white,
//               prefixIconColor: Colors.white,
//               borderColor: Colors.white,
//               isMultiline: true,
//               textColor: Colors.white,
//               hintColor: Colors.white.withOpacity(0.7),
//               borderRadius: 10,
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 right: 25,
//               ),
//               child: RichText(
//                 text: TextSpan(
//                   style: const TextStyle(color: Colors.grey, fontSize: 14.0),
//                   children: <TextSpan>[
//                     TextSpan(
//                       text: 'Forget Password ?',
//                       style: const TextStyle(
//                         color: Colors.white,
//                         decoration: TextDecoration.underline,
//                       ),
//                       recognizer: TapGestureRecognizer()..onTap = () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Center(
//             child: FormHelper.submitButton(
//               "AddJob",
//               () {
//                 if (validateAndSave()) {
//                   setState(() {
//                     isApiCallProcess = true;
//                   });

//                   Job model = Job(
//                     id: 0,
//                     title: title,
//                     poster: poster,
//                     description: description,
//                   );
//                   BlocProvider.of<JobBloc>(context).add(JobCreate(model));
//                   setState(() {
//                     BlocProvider.of<JobBloc>(context).add(JobLoad());
//                     isApiCallProcess = false;
//                     Future.delayed(Duration(seconds: 1))
//                         .then((value) => context.goNamed("jobs"));
//                   });
//                 }
//               },
//               btnColor: HexColor("283B71"),
//               borderColor: Colors.white,
//               txtColor: Colors.white,
//               borderRadius: 10,
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           const Center(
//             child: Text(
//               "OR",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 right: 25,
//               ),
//               child: RichText(
//                 text: TextSpan(
//                   style: const TextStyle(color: Colors.white, fontSize: 14.0),
//                   children: <TextSpan>[
//                     const TextSpan(
//                       text: 'Do you have an account? ',
//                     ),
//                     TextSpan(
//                       text: 'login',
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       recognizer: TapGestureRecognizer()
//                         ..onTap = () {
//                           context.goNamed("login");
//                         },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//         ],
//       ),
//     );
//   }

//   bool validateAndSave() {
//     final form = globalFormKey.currentState;
//     if (form!.validate()) {
//       form.save();
//       return true;
//     }
//     return false;
//   }
// }

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
