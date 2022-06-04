// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// // ignore: import_of_legacy_library_into_null_safe
// import 'package:integration_test/integration_test.dart';
// import 'package:job_vacancy/authentication/screens/login_screens.dart';

// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   group('end-to-end test', () {
//     //This is a login Class Pleae change this class to your own login Class
//     LoginPage loginForm=LoginPage();
//     testWidgets('tap on the login button',
//         (WidgetTester tester) async {
      
//       await tester.pumpWidget(loginForm);
//       await tester.pumpAndSettle();
      
//     expect(find.text('Login'), findsOneWidget);
//     // expect(find.byType(TextFormField), findsNWidgets(2));
//     // expect(find.byType(TextButton), findsOneWidget);
      
//     testWidgets('Form can be submitted', (WidgetTester tester) async {
//     await tester.pumpWidget(loginForm);
//     //please first make a username key on the form in the username field inside the Login Class
//     //please first make a password key in the password field inside the login Class
    
//     final Finder textField=find.byKey(const Key("username")); 
//     final Finder password=find.byKey(const Key("password"));
//     // final Finder login=find.text("Login");
    
//     await tester.enterText(textField,"samuel");
//     await tester.enterText(password,"1234");
//     // await tester.tap(login);
    
//     await tester.pumpAndSettle();
//     expect(find.text("Login"),findsNothing);
   
// });

//    });
//   });
// }
 
 
 
 
 
 
 
 
 
//       // final Finder textField=find.byKey("username");
//       // final Finder password=find.byKey("password");
//       // final Finder login=find.text("Login");

//   //     expect(find.byType(TextFormField), findsNWidgets(2));
      
//   //     await tester.pump();
//       // await tester.enterText(textField,"samuel");
//       // await tester.enterText(password,"1234");
    
//   //     Finder formWidgetFinder = find.byType(Form);
//   //     Form formWidget = tester.widget(formWidgetFinder) as Form;
//   //     GlobalKey<FormState> formKey = formWidget.key as GlobalKey<FormState>;
//   //     expect(formKey.currentState.validate(), isTrue);  
//   //     // final success=await tester.tap(login);
//   //     // await tester.pumpAndSettle();
//   //     // expect(success,findsOneWidget);