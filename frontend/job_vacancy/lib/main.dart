import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:job_vacancy/company/company_models/company_model.dart';
import 'package:job_vacancy/company/company_screens/company_detail.dart';
import 'package:job_vacancy/jobs/job_bloc_folder/job_event.dart';
import 'package:job_vacancy/jobs/job_data_provider/job_data_provider.dart';
import 'package:job_vacancy/jobs/job_repository/job_repository_export.dart';
import 'package:job_vacancy/jobs/job_screens/job_add_update.dart';
import 'package:job_vacancy/jobs/job_screens/job_detail.dart';
import 'package:job_vacancy/user/user_screens/admin_page/about.dart';
import 'package:job_vacancy/user/user_screens/admin_page/admin_page.dart';
import 'package:job_vacancy/user/user_screens/admin_page/logout.dart';
import 'package:job_vacancy/user/user_screens/admin_page/manage_user.dart';
import 'package:job_vacancy/user/user_screens/admin_page/profile.dart';
import 'package:job_vhttps://github.com/samiabat/Flutter-MobileApp-Job-Vacancy.gitacancy/user/user_screens/admin_page/splash.dart';
import 'package:job_vacancy/user/user_screens/home_page.dart';

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
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        name: "home",
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(title: "Home Page"),
      ),
      GoRoute(
        name: "splash",
        path: '/splash',
        builder: (BuildContext context, GoRouterState state) => const Splash(),
      ),
      GoRoute(
        name: 'jobs',
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
      GoRoute(
        name: "add_update",
        path: '/add_update',
        builder: (BuildContext context, GoRouterState state) =>
            const AddUpdateJob(),
      ),
      GoRoute(
        name: "admin",
        path: '/admin',
        builder: (BuildContext context, GoRouterState state) => const Admin(),
        routes: [
          GoRoute(
              name: "profile",
              path: 'profile',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: const Profile(),
                );
              }),
          GoRoute(
              name: "manageuser",
              path: 'manageuser',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: const ManageUserpage(),
                );
              }),
          GoRoute(
              name: "about",
              path: 'about',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: const Aboutpage(),
                );
              }),
          GoRoute(
            name: "logout",
            path: 'logout',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return MaterialPage(
                key: state.pageKey,
                child: const Logoutpage(),
              );
            },
          ),
        ],
      ),
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
