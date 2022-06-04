import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:job_vacancy/authentication/screens/login_screens.dart';
import 'package:job_vacancy/authentication/screens/register_screens.dart';
import 'package:job_vacancy/company/company_models/company_model.dart';
import 'package:job_vacancy/company/company_screens/company_add_update.dart';
import 'package:job_vacancy/company/company_screens/company_detail.dart';
import 'package:job_vacancy/jobs/job_bloc_folder/job_event.dart';
import 'package:job_vacancy/jobs/job_data_provider/job_data_provider.dart';
import 'package:job_vacancy/jobs/job_repository/job_repository_export.dart';
import 'package:job_vacancy/jobs/job_screens/job_add_update.dart';
import 'package:job_vacancy/jobs/job_screens/job_detail.dart';
import 'package:job_vacancy/login_info.dart';
import 'package:job_vacancy/user/user_screens/admin_page/about.dart';
import 'package:job_vacancy/user/user_screens/admin_page/admin_page.dart';
import 'package:job_vacancy/user/user_screens/admin_page/logout.dart';
import 'package:job_vacancy/user/user_screens/admin_page/manage_user.dart';
import 'package:job_vacancy/user/user_screens/admin_page/profile.dart';
import 'package:job_vacancy/user/user_screens/admin_page/splash.dart';
import 'package:job_vacancy/user/user_screens/home_page.dart';

import 'company/company_bloc_folder/company_bloc_export.dart';
import 'company/company_data_provider/company_data_provider_export.dart';
import 'company/company_repository/company_repository_export.dart';
import 'company/company_screens/company_list.dart';
import 'jobs/job_bloc_folder/job_bloc.dart';
import 'jobs/job_models/job.dart';
import 'jobs/job_screens/job_list..dart';

Future<void> main() async {
  final loginInfo = LoginInfo();

  bool isLogged = false;
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    redirect: (state) {
      final isLoggedin = loginInfo.loggedIn.then((value) => {isLogged = value});
      final isLogging = state.location == '/login';
      final isRegistering = state.location == '/register';
      // if (isLogged) return '/home';
      if (!isLogged && !isLogging && !isRegistering) {
        return '/login';
      }
      if (isLogged && isRegistering) return '/home';
      if (isLogged && isLogging) return '/home';
      return null;
    },
    refreshListenable: loginInfo,
    routes: <GoRoute>[
      GoRoute(
        name: "splash",
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const Splash(),
      ),
      GoRoute(
        name: "home",
        path: '/home',
        builder: (BuildContext context, GoRouterState state) =>
            HomePage(title: "Home Page"),
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
      GoRoute(
        name: 'jobs',
        path: '/jobs',
        builder: (BuildContext context, GoRouterState state) => JobsList(),
        routes: [
          GoRoute(
            name: "details",
            path: ':id',
            pageBuilder: (context, state) {
              final job = MyApp._fromJob(state.params['id']);
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
          name: "companies",
          path: '/companies',
          builder: (BuildContext context, GoRouterState state) =>
              CompanysList(),
          routes: [
            GoRoute(
              name: "companyDetails",
              path: ':id',
              pageBuilder: (context, state) {
                final company = MyApp._fromCompany(state.params['id']);
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
        name: "addCompany",
        path: '/add_company',
        builder: (BuildContext context, GoRouterState state) =>
            const AddCompanyPage(),
      ),
      GoRoute(
        name: "add_update",
        path: '/add_update',
        builder: (BuildContext context, GoRouterState state) =>
            const AddJobPage(),
      ),
      GoRoute(
        name: "admin",
        path: '/admin',
        builder: (BuildContext context, GoRouterState state) => const Admin(),
      ),
      GoRoute(
        name: "login",
        path: '/login',
        builder: (BuildContext context, GoRouterState state) => LoginPage(),
      ),
      GoRoute(
        name: "register",
        path: '/register',
        builder: (BuildContext context, GoRouterState state) => RegisterPage(),
      ),
    ],
  );

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

  runApp(
    MultiBlocProvider(
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
      child: MyApp(router: _router),
    ),
  );
}

class MyApp extends StatefulWidget {
  GoRouter router;
  MyApp({Key? key, required this.router}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();

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

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routeInformationParser: widget.router.routeInformationParser,
        routerDelegate: widget.router.routerDelegate,
      );
}
