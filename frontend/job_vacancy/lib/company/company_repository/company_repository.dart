import 'package:job_vacancy/company/company.dart';

import '../company_data_provider/company_deta.dart';

class CompanyRepository {
  final CompanyDataProvider dataProvider;

  CompanyRepository({required this.dataProvider}) : assert(dataProvider != null);

  Future<Company> createCompany(Company company) async {
    return await dataProvider.createCompany(company);
  }

  Future<List<Company>> getCompanies() async {
    return await dataProvider.getCompanies();
  }

  Future<void> updateCompany(Company company) async {
    await dataProvider.updateCompany(company);
  }

  Future<void> deleteCompany(String id) async {
    await dataProvider.deleteCompany(id);
  }
}
