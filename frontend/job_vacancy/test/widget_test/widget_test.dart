import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:job_vacancy/main.dart';
import 'package:job_vacancy/user/user_screens/login_screen/login_screen.dart';
import 'package:job_vacancy/user/user_screens/profile_page/about.dart';

void main() {
  group("Widget tesing", () {
    final aboutRoute = GoRouter(
      routes: <GoRoute>[
        GoRoute(
            name: "about",
            path: '/about',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return MaterialPage(
                key: state.pageKey,
                child: Container(),
              );
            }),
      ],
    );

    final logoutRoute = GoRouter(routes: <GoRoute>[
      GoRoute(
        name: "login",
        path: '/Login',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(
            key: state.pageKey,
            child: const LoginPage(),
          );
        },
      )
    ]);

// About
    testWidgets("logout testing", (tester) async {
      await tester.pumpWidget(MyApp(router: logoutRoute));
      final button = find.byType(GoRouter);
      await tester.pump();
      expect(button, findsNothing);
    });

    testWidgets("About page widget testing", (tester) async {
      await tester.pumpWidget(MyApp(router: aboutRoute));
      final text = find.text("About");
      await tester.pump();
      expect(text, findsNothing);
    });
  });
}
