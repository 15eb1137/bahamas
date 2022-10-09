import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

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
  testWidgets('BackArrowButton test', (tester) async {
    final callback = MockCallBack();
    await tester.pumpWidget(wrap(BackArrowButton(callback.called)));
    await tester.tap(find.byType(BackArrowButton));
    await tester.pump();
    expect(callback.count, 1);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });
  testWidgets('MemoMenuButton test', (tester) async {
    await tester.pumpWidget(wrap(const MemoMenuButton()));
    expect(find.byIcon(Icons.more_vert), findsOneWidget);
    expect(find.byType(ModalBottomSheet), findsNothing);
    await tester.tap(find.byType(MemoMenuButton));
    await tester.pump();
    expect(find.byType(ModalBottomSheet), findsOneWidget);
  });
  testWidgets('ModalBottomSheet test', (tester) async {
    await tester.pumpWidget(wrap(const ModalBottomSheet()));
  });
  testWidgets('LastEdit test', (tester) async {
    final now = DateTime(2022, 4, 1, 12, 0, 0);
    final lastEditDateTimeToday = DateTime(2022, 4, 1, 0, 0, 0);
    await tester
        .pumpWidget(wrap(LastEdit(now: now, lastEdit: lastEditDateTimeToday)));
    expect(find.text('編集時刻: 00:00'), findsOneWidget);

    final lastEditDateTimeYesterday = DateTime(2022, 3, 31, 23, 59, 59);
    await tester.pumpWidget(
        wrap(LastEdit(now: now, lastEdit: lastEditDateTimeYesterday)));
    expect(find.text('編集時刻: 昨日23:59'), findsOneWidget);

    final lastEditDateTimeTwoDaysAgo = DateTime(2022, 3, 30, 23, 59, 59);
    await tester.pumpWidget(
        wrap(LastEdit(now: now, lastEdit: lastEditDateTimeTwoDaysAgo)));
    expect(find.text('編集日時: 3月30日'), findsOneWidget);

    final lastEditDateTimeThisYear = DateTime(2022, 1, 1, 0, 0, 0);
    await tester.pumpWidget(
        wrap(LastEdit(now: now, lastEdit: lastEditDateTimeThisYear)));
    expect(find.text('編集日時: 1月1日'), findsOneWidget);

    final lastEditDateTimeLastYear = DateTime(2021, 12, 31, 23, 59, 59);
    await tester.pumpWidget(
        wrap(LastEdit(now: now, lastEdit: lastEditDateTimeLastYear)));
    expect(find.text('編集日時: 2021年12月31日'), findsOneWidget);
  });
  testWidgets('Memo test', (tester) async {
    await tester.pumpWidget(wrap(const Memo()));
    expect(find.byType(BackArrowButton), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(
        find.byWidgetPredicate((widget) =>
            widget is TextField &&
            widget.maxLines == 1 &&
            widget.textInputAction == TextInputAction.next),
        findsOneWidget);
    expect(
        find.byWidgetPredicate((widget) =>
            widget is TextField &&
            widget.keyboardType == TextInputType.multiline &&
            widget.maxLines == null &&
            widget.textInputAction == TextInputAction.newline),
        findsOneWidget);
    expect(find.byType(LastEdit), findsOneWidget);
    expect(find.byType(MemoMenuButton), findsOneWidget);
  });
}

class LastEdit extends StatelessWidget {
  LastEdit({Key? key, DateTime? now, DateTime? lastEdit})
      : now = now ?? DateTime.now(),
        lastEdit = lastEdit ?? DateTime(1900),
        super(key: key);

  final DateTime now; // TODO: Providerにする
  final DateTime lastEdit;

  @override
  Widget build(BuildContext context) {
    final dateOnlyNow = DateTime(now.year, now.month, now.day);
    final dateOnlyLastEdit =
        DateTime(lastEdit.year, lastEdit.month, lastEdit.day);
    final bool isToday = dateOnlyNow.isAtSameMomentAs(dateOnlyLastEdit);
    final bool isYesterday = dateOnlyNow
        .subtract(const Duration(days: 1))
        .isAtSameMomentAs(dateOnlyLastEdit);
    final bool editedInThisYear = lastEdit.year == now.year;
    String _text;

    if (isToday) {
      _text = DateFormat.Hm().format(lastEdit);
    } else if (isYesterday) {
      _text = '昨日${DateFormat.Hm().format(lastEdit)}';
    } else if (!editedInThisYear) {
      _text = DateFormat('yyyy年M月d日').format(lastEdit);
    } else {
      _text = DateFormat('M月d日').format(lastEdit);
    }
    return Text('編集${isToday || isYesterday ? '時刻' : '日時'}: $_text');
  }
}

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class MemoMenuButton extends StatelessWidget {
  const MemoMenuButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModalBottomSheet<void>(
              context: context, builder: (context) => const ModalBottomSheet());
        },
        icon: const Icon(Icons.more_vert));
  }
}

class Memo extends StatelessWidget {
  const Memo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BackArrowButton(() {}),
      const TextField(maxLines: 1, textInputAction: TextInputAction.next),
      const TextField(maxLines: null, textInputAction: TextInputAction.newline),
      Row(children: [LastEdit(), const MemoMenuButton()]),
    ]);
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
