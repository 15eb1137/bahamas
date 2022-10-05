import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'test_data.dart';

void main() {
  testWidgets('TextField Learning test', (tester) async {
    await tester.pumpWidget(wrap(const TextField()));
    expect(tester.testTextInput.isVisible, false);

    await tester.tap(find.byType(TextField));
    await tester.pump();
    expect(tester.testTextInput.isVisible, true);

    await tester.enterText(find.byType(TextField), 'あ');
    await tester.enterText(find.byType(TextField), 'い');
    await tester.pump();
    expect(find.text('あい'), findsNothing);
    expect(find.text('い'), findsOneWidget);
  });
}

Widget wrap(Widget child) {
  return MaterialApp(home: Material(child: child));
}
