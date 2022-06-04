import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

class HomePage extends StatefulWidget {
  const HomePage({ super.key });

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool _didInitState = false;

  @override
  void initState() {
    super.initState();
    _didInitState = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
void main() {
  testWidgets('resync stateful widget', (WidgetTester tester) async {
    const Key homeKey = Key('inner');
    const HomePage home = HomePage(key: homeKey);
    await tester.pumpWidget(home);
    final StatefulElement innerElement = tester.element(find.byKey(homeKey));
    final HomePagetState innerElementState = innerElement.state as HomePageState;
    
    expect(innerElementState.widget, equals(home));
    expect(innerElementState._didInitState, isTrue);
    
    await tester.pump();
    expect(tester.element(find.byKey(homeKey)), equals(innerElement));
    expect(innerElement.state, equals(innerElementState));
  

  });
}