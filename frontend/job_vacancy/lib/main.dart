import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:job_vacancy/jobs/job_bloc_folder/job_event.dart';
import 'package:job_vacancy/jobs/job_data_provider/job_data_provider.dart';
import 'package:job_vacancy/jobs/job_repository/job_repository_export.dart';
import 'package:job_vacancy/jobs/job_screens/job_detail.dart';
import 'package:job_vacancy/page1.dart';

import 'jobs/job_bloc_folder/job_bloc.dart';
import 'jobs/job_screens/job_add_update.dart';
import 'jobs/job_screens/job_list..dart';

void main() {
  // Bloc.observer = SimpleBlocObserver();
  final JobRepository jobRepository = JobRepository(
    dataProvider: JobDataProvider(
      httpClient: http.Client(),
    ),
  );

  runApp(BlocProvider(
    create: (context) =>
        JobBloc(jobRepository: jobRepository)..add(const JobLoad()),
    child: MyApp(),
  ));
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
      ),
      GoRoute(
        path: '/companies',
        builder: (BuildContext context, GoRouterState state) => Container(),
      ),
      GoRoute(
        name: "course detail",
        path: '/jobs/detail',
        builder: (BuildContext context, GoRouterState state) => JobDetail(),
      ),
      // GoRoute(
      //   name: "course detail",
      //   path: '/createJob',
      //   builder: (BuildContext context, GoRouterState state) => AddUpdateJob(),
      // ),
    ],
  );
}
