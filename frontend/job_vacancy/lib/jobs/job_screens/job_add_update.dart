import 'package:flutter/material.dart';
import '../job_bloc_folder/job_event.dart';
import '../job_models/job.dart';

class AddUpdateJob extends StatefulWidget {
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
        title: Text("Add New job"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  initialValue: '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter job title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Course title'),
                  onSaved: (value) {
                    this._job["title"] = value;
                  }),
              TextFormField(
                  initialValue: '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter course description';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'job description'),
                  onSaved: (value) {
                    this._job["description"] = value;
                  }),
              TextFormField(
                  initialValue: '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter poster ects';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'job poster'),
                  onSaved: (value) {
                    this._job["poster"] = int.parse('$value');
                  }),
              TextFormField(
                  initialValue: '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter job description';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Job Description'),
                  onSaved: (value) {
                    this._job["description"] = value;
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form!.validate()) {
                      form.save();
                      final JobEvent event = JobCreate(
                        Job(
                          id: this._job["id"],
                          title: this._job["title"],
                          poster: this._job["poster"],
                          description: this._job["description"],
                          date_created: '',
                          date_updated: '',
                        ),
                      );
                      // BlocProvider.of<JobBloc>(context).add(event);
                    }
                  },
                  label: Text('SAVE'),
                  icon: Icon(Icons.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
