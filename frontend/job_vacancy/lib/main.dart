import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
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
        path: '/page2',
        builder: (BuildContext context, GoRouterState state) =>
            const Page2Screen(),
      ),
      GoRoute(
        path: '/page2',
        builder: (BuildContext context, GoRouterState state) =>
            const Page2Screen(),
      ),
      GoRoute(
        path: '/page2',
        builder: (BuildContext context, GoRouterState state) =>
            const Page2Screen(),
      ),
      GoRoute(
        path: '/page2',
        builder: (BuildContext context, GoRouterState state) =>
            const Page2Screen(),
      ),
      GoRoute(
        path: '/page2',
        builder: (BuildContext context, GoRouterState state) =>
            const Page2Screen(),
      ),
      GoRoute(
        path: '/page2',
        builder: (BuildContext context, GoRouterState state) =>
            const Page2Screen(),
      ),
    ],
  );
}
