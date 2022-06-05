import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:integration_test/integration_test.dart';
import 'package:job_vacancy/user/user_screens/login_screen/login_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    LoginPage loginForm = const LoginPage();
    testWidgets('tap on the login button', (WidgetTester tester) async {
      await tester.pumpWidget(loginForm);
      await tester.pumpAndSettle();

      expect(find.text('Login'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.byType(TextButton), findsOneWidget);

      testWidgets('Form can be submitted', (WidgetTester tester) async {
        await tester.pumpWidget(loginForm);

        final Finder textField = find.text("username");
        final Finder password = find.text("password");
        final Finder button =find.byType(ElevatedButton);
        await tester.enterText(textField, "samuel");
        await tester.enterText(password, "1234");
        await tester.tap(button);
        await tester.pumpAndSettle();
        expect(find.text("Sign Up"), findsNothing);
      });
    });
  });
}
