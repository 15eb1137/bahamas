import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/domainModel/sticky/stickies.dart';
import '../notifier/search/search_notifier.dart';
import '../notifier/sticky/stickies_notifier.dart';
import '../widget/search/search_conditions_form.dart';
import '../widget/search/search_text_field_start_with.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chipsData = ref.watch(chipsDataProvider);
    final searchNotifier = ref.watch(searchNotifierProvider.notifier);

    return Scaffold(
      body: Column(children: [
        const SearchConditionsForm(),
        ElevatedButton(
            onPressed: () async {
              searchNotifier.changeCondition('^${chipsData.first['text']}.*');
              final result = await searchNotifier.search();
              ref.watch(resultStickiesProvider.notifier).state = result;
              await ref.watch(stickiesNotifierProvider.notifier).fetchAll();
              context.go('/stickiesResult');
            },
            child: const Text('検索')),
        SearchTextFieldStartWith(
          addStartWithChip: (text) {
            ref.read(chipsDataProvider.notifier).state = [
              ...ref.read(chipsDataProvider),
              <String, dynamic>{'type': 'startWith', 'text': text}
            ];
          },
        )
      ]),
    );
  }
}

final resultStickiesProvider =
    StateProvider<Stickies>((ref) => Stickies(children: []));

final chipsDataProvider =
    StateProvider<List<Map<String, dynamic>>>((ref) => []);
