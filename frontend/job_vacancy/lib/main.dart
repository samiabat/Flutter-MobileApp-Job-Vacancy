import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
// import 'package:job_vacancy/authentication/screens/register_screens.dart';
import 'package:job_vacancy/company/company_models/company_model.dart';
import 'package:job_vacancy/company/company_screens/company_add_update.dart';
import 'package:job_vacancy/company/company_screens/company_detail.dart';
import 'package:job_vacancy/jobs/job_bloc_folder/job_event.dart';
import 'package:job_vacancy/jobs/job_data_provider/job_data_provider.dart';
import 'package:job_vacancy/jobs/job_repository/job_repository_export.dart';
import 'package:job_vacancy/jobs/job_screens/job_add_update.dart';
import 'package:job_vacancy/jobs/job_screens/job_detail.dart';
import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_bloc.dart';
import 'package:job_vacancy/user/user_bloc_folder/user/bloc/user_event.dart';
import 'package:job_vacancy/user/user_data_provider/route_controller.dart';
import 'package:job_vacancy/user/user_data_provider/user_data_provider.dart';
import 'package:job_vacancy/user/user_models/registeration_request.dart';
import 'package:job_vacancy/user/user_repository/user_repository_export.dart';
import 'package:job_vacancy/user/user_screens/home_page.dart';
import 'package:job_vacancy/user/user_screens/login_screen/login_screen.dart';
import 'package:job_vacancy/user/user_screens/login_screen/register_screen.dart';
import 'package:job_vacancy/user/user_screens/login_screen/update_profile.dart';
import 'package:job_vacancy/user/user_screens/profile_page/admin_page.dart';
import 'package:job_vacancy/user/user_screens/profile_page/logout.dart';
import 'package:job_vacancy/user/user_screens/profile_page/manage_user.dart';
import 'package:job_vacancy/user/user_screens/profile_page/profile.dart';
import 'package:job_vacancy/user/user_screens/profile_page/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'company/company_bloc_folder/company_bloc_export.dart';
import 'company/company_data_provider/company_data_provider_export.dart';
import 'company/company_repository/company_repository_export.dart';
import 'company/company_screens/company_list.dart';
import 'jobs/job_bloc_folder/job_bloc.dart';
import 'jobs/job_models/job.dart';
import 'jobs/job_screens/job_list..dart';

Future<void> main() async {
  final _router = GoRouter(
    initialLocation: '/',
    redirect: (state) {
      final isLogged = loginInfo.getName;
      final isLogging = state.location == '/login';

      final isRegistering = state.location == '/register';

      if (!isLogged && !isLogging && !isRegistering) return '/login';

      if (isLogged && isLogging) return '/home';
      if (isLogged && isRegistering) return '/home';
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
            pageBuilder: (context, state) {
              final user = MyApp._fromUser();
              final id = MyApp._thisId();
              return MaterialPage(
                key: state.pageKey,
                child: Profile(
                  user: user,
                  id: id,
                ),
              );
            },
          ),
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
            AddEditJobPage(),
      ),
      GoRoute(
        name: "updateprofile",
        path: '/updateprofile',
        builder: (BuildContext context, GoRouterState state) =>
            UpdateProfilePage(),
      ),
      GoRoute(
        name: "admin",
        path: '/admin',
        builder: (BuildContext context, GoRouterState state) => const Admin(),
      ),
      GoRoute(
        name: "login",
        path: '/login',
        builder: (BuildContext context, GoRouterState state) =>
            const LoginPage(),
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

  final UserRepository userRepository = UserRepository(
    dataProvider: UserDataProvider(),
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
        BlocProvider<UserBloc>(
          create: (BuildContext context) =>
              UserBloc(userRepository: userRepository)..add(UserLogging()),
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

  // static Future<UserRegister> profile(String? id) async {
  //   final UserRepository userRepository =
  //       UserRepository(dataProvider: UserDataProvider());
  //   return await userRepository.getProfile();
  // }

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

  static Future<RegisterRequestModel> _fromUser() async {
    final UserRepository userRepository = UserRepository(
      dataProvider: UserDataProvider(),
    );
    SharedPreferences sp = await SharedPreferences.getInstance();
    var id = sp.getString("userid");
    final user = await userRepository.userById(id);
    return user;
  }

  static Future<String> _thisId() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final String? id = sp.getString("userid");
    print(id);
    return id!;
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
