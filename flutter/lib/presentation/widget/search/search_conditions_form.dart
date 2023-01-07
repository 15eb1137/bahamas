import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'search_badge_start_with.dart';

class SearchConditionsForm extends StatelessWidget {
  final List<Map<String, dynamic>> chipsData;

  const SearchConditionsForm({super.key, required this.chipsData});

  @override
  Widget build(BuildContext context) {
    final List<Widget> startWithChips = chipsData.map((data) {
      if (data['type'] == 'startWith') {
        return SearchBadgeStartWith(text: data['text'].toString());
      } else {
        return Container();
      }
    }).toList();
    return Wrap(children: startWithChips);
  }
}
