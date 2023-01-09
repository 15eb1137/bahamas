import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

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
    final _focusNode = FocusNode();
    return Focus(
        focusNode: _focusNode,
        child: GestureDetector(
          onTap: () {
            _focusNode.requestFocus();
            if (ref.read(searchTextFieldStartWithEditingTextProvider).text !=
                '') {
              ref.read(chipsDataProvider.notifier).state = [
                ...ref.read(chipsDataProvider),
                <String, dynamic>{
                  'id': const Uuid().v4(),
                  'type': 'startWith',
                  'text':
                      ref.read(searchTextFieldStartWithEditingTextProvider).text
                }
              ];
              ref.read(searchTextFieldStartWithEditingTextProvider).clear();
            }
          },
          child: Scaffold(
            body: Column(children: [
              const SearchConditionsForm(),
              ElevatedButton(
                  onPressed: () async {
                    searchNotifier
                        .changeCondition('^${chipsData.first['text']}.*');
                    final result = await searchNotifier.search();
                    ref.watch(resultStickiesProvider.notifier).state = result;
                    await ref
                        .watch(stickiesNotifierProvider.notifier)
                        .fetchAll();
                    context.go('/stickiesResult');
                  },
                  child: const Text('検索')),
              const SearchTextFieldStartWith()
            ]),
          ),
        ));
  }
}

final resultStickiesProvider =
    StateProvider<Stickies>((ref) => Stickies(children: []));

final chipsDataProvider =
    StateProvider<List<Map<String, dynamic>>>((ref) => []);
