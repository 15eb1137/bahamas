
import 'package:bahamas/presentation/widget/sticky/sticky_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'test_data.dart';

void main() {
  testWidgets('TextField Learning test', (tester) async {
    await tester.pumpWidget(wrap(const StickyTextField()));
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
  // testWidgets('MemoMenuButton test', (tester) async {
  //   await tester.pumpWidget(wrap(const MemoMenuButton()));
  //   expect(find.byIcon(Icons.more_vert), findsOneWidget);
  //   expect(find.byType(ModalBottomSheet), findsNothing);
  //   await tester.tap(find.byType(MemoMenuButton));
  //   await tester.pump();
  //   expect(find.byType(ModalBottomSheet), findsOneWidget);
  // });

  // testWidgets('LastEdit test', (tester) async {
  //   final now = DateTime(2022, 4, 1, 12, 0, 0);
  //   final lastEditDateTimeToday = DateTime(2022, 4, 1, 0, 0, 0);
  //   await tester
  //       .pumpWidget(wrap(LastEdit(now: now, lastEdit: lastEditDateTimeToday)));
  //   expect(find.text('編集時刻: 00:00'), findsOneWidget);

  //   final lastEditDateTimeYesterday = DateTime(2022, 3, 31, 23, 59, 59);
  //   await tester.pumpWidget(
  //       wrap(LastEdit(now: now, lastEdit: lastEditDateTimeYesterday)));
  //   expect(find.text('編集時刻: 昨日23:59'), findsOneWidget);

  //   final lastEditDateTimeTwoDaysAgo = DateTime(2022, 3, 30, 23, 59, 59);
  //   await tester.pumpWidget(
  //       wrap(LastEdit(now: now, lastEdit: lastEditDateTimeTwoDaysAgo)));
  //   expect(find.text('編集日時: 3月30日'), findsOneWidget);

  //   final lastEditDateTimeThisYear = DateTime(2022, 1, 1, 0, 0, 0);
  //   await tester.pumpWidget(
  //       wrap(LastEdit(now: now, lastEdit: lastEditDateTimeThisYear)));
  //   expect(find.text('編集日時: 1月1日'), findsOneWidget);

  //   final lastEditDateTimeLastYear = DateTime(2021, 12, 31, 23, 59, 59);
  //   await tester.pumpWidget(
  //       wrap(LastEdit(now: now, lastEdit: lastEditDateTimeLastYear)));
  //   expect(find.text('編集日時: 2021年12月31日'), findsOneWidget);
  // });
}

Widget wrap(Widget child) {
  return MaterialApp(home: Material(child: ProviderScope(child: child)));
}

class MockCallBack {
  int count = 0;

  void called() {
    count++;
  }
}
