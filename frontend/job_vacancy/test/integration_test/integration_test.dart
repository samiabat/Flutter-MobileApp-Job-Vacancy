import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    Login loginForm=Login();
    testWidgets('tap on the login button',
        (WidgetTester tester) async {
      
      await tester.pumpWidget(loginForm);
      await tester.pumpAndSettle();
      
    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(TextButton), findsOneWidget);
      
    testWidgets('Form can be submitted', (WidgetTester tester) async {
    await tester.pumpWidget(oginForm);
    final Finder textField=find.byKey("username");
    final Finder password=find.byKey("password");
    final Finder login=find.text("Login");
    
    await tester.enterText(textField,"samuel");
    await tester.enterText(password,"1234");
    await tester.tap(login);
    
    await tester.pumpAndSettle();
    expect(find.text("Login"),findsNothing);
    
});

   });
  });
}
 
 
 
 
 
 
 
 
 
      // final Finder textField=find.byKey("username");
      // final Finder password=find.byKey("password");
      // final Finder login=find.text("Login");

  //     expect(find.byType(TextFormField), findsNWidgets(2));
      
  //     await tester.pump();
      // await tester.enterText(textField,"samuel");
      // await tester.enterText(password,"1234");
    
  //     Finder formWidgetFinder = find.byType(Form);
  //     Form formWidget = tester.widget(formWidgetFinder) as Form;
  //     GlobalKey<FormState> formKey = formWidget.key as GlobalKey<FormState>;
  //     expect(formKey.currentState.validate(), isTrue);  
  //     // final success=await tester.tap(login);
  //     // await tester.pumpAndSettle();
  //     // expect(success,findsOneWidget);
    
 
 