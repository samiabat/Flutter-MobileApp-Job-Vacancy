import 'package:bloc_test/bloc_test.dart';
import 'package:http/http.dart';
import 'package:job_vacancy/company/company_bloc_folder/company_bloc_export.dart';
import 'package:job_vacancy/company/company_data_provider/company_data_provider_export.dart';
import 'package:job_vacancy/company/company_repository/company_repository_export.dart';
import 'package:test/test.dart';

void main() {
  CompanyRepository companyRepository = CompanyRepository(
    dataProvider: CompanyDataProvider(
      httpClient: Client(),
    ),
  );
  group("Company unit test", () {
    blocTest<CompanyBloc, CompanyState>(
      "Emit [CompanyLoading]",
      build: () => CompanyBloc(companyRepository: companyRepository),
      act: (bloc) => bloc.add(const CompanyLoad()),
      expect: () => CompanyLoading(),
    );
  });
}
