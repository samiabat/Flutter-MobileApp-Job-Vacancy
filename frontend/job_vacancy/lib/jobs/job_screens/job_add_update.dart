import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_vacancy/jobs/job_bloc_folder/job_bloc.dart';
import '../job_bloc_folder/job_event.dart';
import '../job_models/job.dart';

class AddUpdateJob extends StatefulWidget {
  const AddUpdateJob({Key? key}) : super(key: key);

  @override
  _AddUpdateCourseState createState() => _AddUpdateCourseState();
}

class _AddUpdateCourseState extends State<AddUpdateJob> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _job = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New job"),
        actions: [
          IconButton(
            onPressed: () => GoRouter.of(context).goNamed("jobs"),
            icon: const Icon(Icons.home),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                    initialValue: '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter id ';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Job id'),
                    onSaved: (value) {
                      _job["id"] = value;
                    }),
                TextFormField(
                    initialValue: '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter date created';
                      }
                      return null;
                    },
                    decoration:
                        const InputDecoration(labelText: 'Job date created'),
                    onSaved: (value) {
                      _job["date_created"] = value;
                    }),
                TextFormField(
                    initialValue: '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter job description';
                      }
                      return null;
                    },
                    decoration:
                        const InputDecoration(labelText: 'job description'),
                    onSaved: (value) {
                      _job["description"] = value;
                    }),
                TextFormField(
                    initialValue: '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter job poster';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'job poster'),
                    onSaved: (value) {
                      _job["poster"] = value;
                    }),
                TextFormField(
                    initialValue: '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter date  updated';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'date update'),
                    onSaved: (value) {
                      _job["date_updated"] = value;
                    }),
                TextFormField(
                    initialValue: '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter job date';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Job title'),
                    onSaved: (value) {
                      _job["title"] = value;
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      final form = _formKey.currentState;
                      if (form!.validate()) {
                        Job job = Job(
                          id: 1,
                          title: _job["title"],
                          poster: int.parse(_job["poster"]),
                          description: _job["description"],
                          date_created: '',
                          date_updated: '',
                        );
                        // BlocProvider.of<JobBloc>(context).add(JobCreate(job));
                        // form.save();
                        final JobEvent event = JobCreate(
                          Job(
                            id: 1,
                            title: _job["title"],
                            poster: int.parse(_job["poster"]),
                            description: _job["description"],
                            date_created: '',
                            date_updated: '',
                          ),
                        );
                        // BlocProvider.of<JobBloc>(context).add(event);
                        BlocProvider.of<JobBloc>(context).add(event);
                      }
                    },
                    label: const Text('SAVE'),
                    icon: const Icon(Icons.save),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
