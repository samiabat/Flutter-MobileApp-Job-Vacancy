// import 'package:flutter/widgets.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:job_vacancy/main.dart';

// void main() {
//   testWidgets('resync stateful widget', (WidgetTester tester) async {
//     const Key homeKey = Key('inner');
//     MyApp main = MyApp(key: homeKey);

//     await tester.pumpWidget(MyApp());
//     final StatefulElement innerElement = tester.element(find.byKey(homeKey));
//     final _MyAppState innerElementState = innerElement.state as _MyAppState;

//     expect(innerElementState.widget, equals(main));
//     // expect(innerElementState.didInitState, isTrue);

//     // await tester.pump();
//     // expect(tester.element(find.byKey(homeKey)), equals(innerElement));
//     // expect(innerElement.state, equals(innerElementState));
//   });
// }
