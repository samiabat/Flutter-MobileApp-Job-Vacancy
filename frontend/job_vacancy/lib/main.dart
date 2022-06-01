import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:job_vacancy/company/company_models/company_model.dart';
import 'package:job_vacancy/company/company_screens/company_detail.dart';
import 'package:job_vacancy/jobs/job_bloc_folder/job_event.dart';
import 'package:job_vacancy/jobs/job_data_provider/job_data_provider.dart';
import 'package:job_vacancy/jobs/job_repository/job_repository_export.dart';
import 'package:job_vacancy/jobs/job_screens/job_detail.dart';
import 'package:job_vacancy/page1.dart';

import 'company/company_bloc_folder/company_bloc_export.dart';
import 'company/company_data_provider/company_data_provider_export.dart';
import 'company/company_repository/company_repository_export.dart';
import 'company/company_screens/company_list.dart';
import 'jobs/job_bloc_folder/job_bloc.dart';
import 'jobs/job_models/job.dart';
import 'jobs/job_screens/job_list..dart';

void main() {
  // Bloc.observer = SimpleBlocObserver();
  final JobRepository jobRepository = JobRepository(
    dataProvider: JobDataProvider(
      httpClient: http.Client(),
    ),
  );

  final CompanyRepository companyRepository = CompanyRepository(
    dataProvider: CompanyDataProvider(
      httpClient: http.Client(),
    ),
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<JobBloc>(
        create: (BuildContext context) =>
            JobBloc(jobRepository: jobRepository)..add(const JobLoad()),
      ),
      BlocProvider<CompanyBloc>(
        create: (BuildContext context) =>
            CompanyBloc(companyRepository: companyRepository)
              ..add(const CompanyLoad()),
      ),
      // BlocProvider<BlocC>(
      //   create: (BuildContext context) => BlocC(),
      // ),
    ],
    child: MyApp(),
  )

      //   BlocProvider(
      //   create: (context) =>
      //       JobBloc(jobRepository: jobRepository)..add(const JobLoad()),
      //   child: MyApp(),
      // )

      );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      );
  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const Page1Screen(),
      ),
      GoRoute(
        path: '/jobs',
        builder: (BuildContext context, GoRouterState state) => JobsList(),
        routes: [
          GoRoute(
            name: "details",
            path: ':id',
            pageBuilder: (context, state) {
              final job = _fromJob(state.params['id']);
              return MaterialPage(
                key: state.pageKey,
                child: JobDetail(
                  job: job,
                ),
              );
            },
          ),
        ],
      ),
      GoRoute(
          path: '/companies',
          builder: (BuildContext context, GoRouterState state) =>
              CompanysList(),
          routes: [
            GoRoute(
              name: "companyDetails",
              path: ':id',
              pageBuilder: (context, state) {
                final company = _fromCompany(state.params['id']);
                return MaterialPage(
                  key: state.pageKey,
                  child: CompanyDetail(
                    company: company,
                  ),
                );
              },
            ),
          ]),
      // GoRoute(
      //   name: "course detail",
      //   path: '/jobs/detail',
      //   builder: (BuildContext context, GoRouterState state) => JobDetail(),
      // ),
      // GoRoute(
      //   name: "course detail",
      //   path: '/createJob',
      //   builder: (BuildContext context, GoRouterState state) => AddUpdateJob(),
      // ),
    ],
  );

  static Future<Job> _fromJob(String? id) async {
    final JobRepository jobRepository = JobRepository(
      dataProvider: JobDataProvider(
        httpClient: http.Client(),
      ),
    );
    final jobs = await jobRepository.getJobs();
    final Job job =
        jobs.where((job) => job.id.toString() == id.toString()).first;
    return job;
  }

  static Future<Company> _fromCompany(String? id) async {
    final CompanyRepository companyRepository = CompanyRepository(
      dataProvider: CompanyDataProvider(
        httpClient: http.Client(),
      ),
    );
    final companies = await companyRepository.getCompanies();
    final Company company = companies
        .where((company) => company.id.toString() == id.toString())
        .first;
    return company;
  }
}
