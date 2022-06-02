import 'dart:convert';
import 'package:http/http.dart' as http;
import '../job_models/job_model.dart';

class JobDataProvider {
  final _baseUrl = 'http://127.0.0.1:8000';
  final http.Client httpClient;

  JobDataProvider({required this.httpClient});

  Future<Job> createJob(Job job) async {
    final responce = await httpClient.post(
      (Uri.parse(_baseUrl + '/jobs/')),
      headers: <String, String>{
        'Content-Type': 'application/json;charset:utf-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': job.id,
        'poster': job.poster,
        'description': job.description,
        'date_created': job.date_created,
        'date_updated': job.date_updated,
      }),
    );

    if (responce.statusCode == 200) {
      return Job.fromJson(jsonDecode(responce.body));
    } else {
      throw Exception('Failed to create the job');
    }
  }

  Future<List<Job>> getJobs() async {
    final responce = await httpClient.get(Uri.parse(_baseUrl + '/jobs/'));
    if (responce.statusCode == 200) {
      final jobs = jsonDecode(responce.body) as List;
      return jobs.map((job) => Job.fromJson(job)).toList();
    } else {
      throw Exception('Failed load jobs');
    }
  }

  Future<void> deleteJob(String id) async {
    final http.Response responce = await httpClient.delete(
      Uri.parse(_baseUrl + '/jobs/$id/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (responce.statusCode != 204) {
      throw Exception('Failed to delete !');
    }
  }

  Future<void> updateJob(Job job) async {
    final http.Response responce =
        await httpClient.put(Uri.parse(_baseUrl + '/jobs/${job.id}/'),
            headers: <String, String>{
              'Content-Type': 'application/json;charset:utf-8',
            },
            body: jsonEncode(<String, dynamic>{
              'id': job.id,
              'poster': job.poster,
              'description': job.description,
              'date_created': job.date_created,
              'date_updated': job.date_updated,
            }));

    if (responce.statusCode != 204) {
      throw Exception('Failed to update course.');
    }
  }
}