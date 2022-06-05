import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_vacancy/company/company_bloc_folder/company_bloc_export.dart';
import 'package:job_vacancy/company/company_models/company_model.dart';
import 'package:job_vacancy/user/user_data_provider/route_controller.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class AddEditCompanyPage extends StatefulWidget {
  AddEditCompanyPage({Key? key}) : super(key: key);

  @override
  State<AddEditCompanyPage> createState() => _AddEditCompanyPageState();
}

class _AddEditCompanyPageState extends State<AddEditCompanyPage> {
  final _formKey = GlobalKey<FormState>();

  late String? name;
  int id = int.parse(loginInfo.getid);
  late String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Company"),
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
                          initialValue: '',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter title';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'name',
                            border: OutlineInputBorder(),
                          ),
                          onSaved: (value) {
                            setState(() {
                              name = value;
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
                              try {
                                Company model = Company(
                                  id: id,
                                  name: name!,
                                  description: description!,
                                );
                                BlocProvider.of<CompanyBloc>(context)
                                    .add(CompanyCreate(model));
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
                            }
                          },
                          child: const Text("Add Company"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
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
