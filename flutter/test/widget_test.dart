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
  testWidgets('BackArrowButton Learning test', (tester) async {
    final callback = MockCallBack();
    await tester.pumpWidget(wrap(BackArrowButton(callback.called)));
    await tester.tap(find.byType(BackArrowButton));
    await tester.pump();
    expect(callback.count, 1);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });
  testWidgets('Memo test', (tester) async {
    await tester.pumpWidget(wrap(const Memo()));
    expect(find.byType(BackArrowButton), findsOneWidget);
  });
}

class Memo extends StatelessWidget {
  const Memo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackArrowButton(() {});
  }
}

class BackArrowButton extends StatelessWidget {
  const BackArrowButton(this.onPressed, {Key? key}) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_back));
  }
}

Widget wrap(Widget child) {
  return MaterialApp(home: Material(child: child));
}

class MockCallBack {
  int count = 0;

  void called() {
    count++;
  }
}
