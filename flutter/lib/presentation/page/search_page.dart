// ignore_for_file: prefer_const_constructors

import 'package:bahamas/domain/domainModel/sticky/stickies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../notifier/search/search_notifier.dart';
import '../widget/search/search_conditions_form.dart';
import '../widget/search/search_text_field_start_with.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const chipsData = [
      <String, dynamic>{'type': 'startWith', 'text': '毎日メモ'},
      <String, dynamic>{'type': 'startWith', 'text': 'xxx'},
      <String, dynamic>{'type': 'startWith', 'text': 'yyy'},
      <String, dynamic>{'type': 'startWith', 'text': 'zzz'},
      <String, dynamic>{'type': 'startWith', 'text': 'oooo'},
    ];
    final searchNotifier = ref.watch(searchNotifierProvider.notifier);

    return Scaffold(
      body: Column(children: [
        SearchConditionsForm(
          chipsData: chipsData,
        ),
        ElevatedButton(
            onPressed: () async {
              searchNotifier.changeCondition('^${chipsData.first['text']}.*');
              final result = await searchNotifier.search();
              ref.watch(resultStickiesProvider.notifier).state = result;
              context.go('/stickiesResult');
            },
            child: Text('検索')),
        SearchTextFieldStartWith(
          addStartWithChip: (text) {},
        )
      ]),
    );
  }
}

final resultStickiesProvider =
    StateProvider<Stickies>((ref) => Stickies(children: []));
