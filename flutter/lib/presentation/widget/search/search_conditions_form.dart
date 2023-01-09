import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../page/search_page.dart';
import 'search_badge_end_with.dart';
import 'search_badge_include.dart';
import 'search_badge_start_with.dart';

class SearchConditionsForm extends ConsumerWidget {
  const SearchConditionsForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chipsData = ref.watch(chipsDataProvider);
    final List<Widget> startWithChips = chipsData.map((data) {
      if (data['type'] == 'startWith') {
        return SearchBadgeStartWith(
            id: data['id'].toString(), text: data['text'].toString());
      } else {
        return Container();
      }
    }).toList();
    final List<Widget> endWithChips = chipsData.map((data) {
      if (data['type'] == 'endWith') {
        return SearchBadgeEndWith(
            id: data['id'].toString(), text: data['text'].toString());
      } else {
        return Container();
      }
    }).toList();
    final List<Widget> includeChips = chipsData.map((data) {
      if (data['type'] == 'include') {
        return SearchBadgeInclude(
            id: data['id'].toString(), text: data['text'].toString());
      } else {
        return Container();
      }
    }).toList();
    // final List<Widget> excludeChips = chipsData.map((data) {
    //   if (data['type'] == 'exclude') {
    //     return SearchBadgeExclude(
    //         id: data['id'].toString(), text: data['text'].toString());
    //   } else {
    //     return Container();
    //   }
    // }).toList();
    return Wrap(children: [
      ...startWithChips,
      ...endWithChips,
      ...includeChips,
      // ...excludeChips
    ]);
  }
}
