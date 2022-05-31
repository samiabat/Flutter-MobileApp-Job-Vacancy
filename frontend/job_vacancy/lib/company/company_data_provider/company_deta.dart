import 'dart:convert';
import 'package:http/http.dart' as http;
import '../company.dart';

class CompanyDataProvider {
  final _baseUrl = 'http://127.0.0.1:8000';
  final http.Client httpClient;

  CompanyDataProvider({required this.httpClient});

  Future<Company> createCompany(Company company) async {
    final responce = await httpClient.post(
      Uri.http(_baseUrl, '/companies/'),
      headers: <String, String>{
        'Content-Type': 'application/json;charset:utf-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': company.id,
        'poster': company.poster,
        'description': company.description,
        'date_created': company.date_created,
        'date_updated': company.date_updated,
      }),
    );

    if (responce.statusCode == 200) {
      return Company.fromJson(jsonDecode(responce.body));
    } else {
      throw Exception('Failed to create the Company');
    }
  }

  Future<List<Company>> getCompanies() async {
    final responce = await httpClient.get(Uri.parse(_baseUrl + '/companies/'));
    if (responce.statusCode == 200) {
      final companies = jsonDecode(responce.body) as List;
      return companies.map((company) => Company.fromJson(company)).toList();
    } else {
      throw Exception('Failed load companys');
    }
  }

  Future<void> deleteCompany(String id) async {
    final http.Response responce = await httpClient.delete(
      Uri.http(_baseUrl, '/companiess/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (responce.statusCode != 204) {
      throw Exception('Failed to delete !');
    }
  }

  Future<void> updateCompany(Company company) async {
    final http.Response responce =
        await httpClient.put(Uri.http(_baseUrl, '/companys/${company.id}/'),
            headers: <String, String>{
              'Content-Type': 'application/json;charset:utf-8',
            },
            body: jsonEncode(<String, dynamic>{
              'id': company.id,
              'poster': company.poster,
              'description': company.description,
              'date_created': company.date_created,
              'date_updated': company.date_updated,
            }));

    if (responce.statusCode != 204) {
      throw Exception('Failed to update course.');
    }
  }
}
