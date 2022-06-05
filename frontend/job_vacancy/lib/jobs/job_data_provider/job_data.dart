import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../job_models/job_model.dart';

class JobDataProvider {
  final _baseUrl = 'http://127.0.0.1:8000';
  final http.Client httpClient;

  JobDataProvider({required this.httpClient});

  Future<Job> createJob(Job job) async {
    var tk = await SharedPreferences.getInstance();
    String? token = tk.getString("access");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await httpClient.post(
      Uri.parse("$_baseUrl/jobs/"),
      headers: requestHeaders,
      body: jsonEncode(job.toJson()),
    );

    return jobJson(
      response.body,
    );
  }

  Future<List<Job>> getJobs() async {
    var tk = await SharedPreferences.getInstance();
    String? token = tk.getString("access");

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final responce = await httpClient.get(Uri.parse('$_baseUrl/jobs/'),
        headers: requestHeaders);

    if (responce.statusCode == 200) {
      final jobs = jsonDecode(responce.body) as List;
      return jobs.map((job) => Job.fromJson(job)).toList();
    } else {
      throw Exception('Failed load jobs');
    }
  }

  Future<void> deleteJob(String id) async {
    var tk = await SharedPreferences.getInstance();
    String? token = tk.getString("access");

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final http.Response responce = await httpClient.delete(
      Uri.parse('$_baseUrl/jobs/$id/'),
      headers: requestHeaders,
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
