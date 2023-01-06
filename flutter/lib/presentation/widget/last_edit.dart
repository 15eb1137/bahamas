import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return Text('編集${isToday || isYesterday ? '時刻' : '日時'}: $_text',
        style: const TextStyle(color: Colors.black));
  }
}
