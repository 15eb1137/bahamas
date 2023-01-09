import 'package:bahamas/presentation/widget/search/search_text_field_include.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../domain/domainModel/sticky/stickies.dart';
import '../notifier/search/search_notifier.dart';
import '../notifier/sticky/stickies_notifier.dart';
import '../widget/search/search_conditions_form.dart';
import '../widget/search/search_text_field_end_with.dart';
import '../widget/search/search_text_field_start_with.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  void registChipData(WidgetRef ref) {
    if (ref.read(searchTextFieldStartWithEditingTextProvider).text != '') {
      ref.read(chipsDataProvider.notifier).state = [
        ...ref.read(chipsDataProvider),
        <String, dynamic>{
          'id': const Uuid().v4(),
          'type': 'startWith',
          'text': ref.read(searchTextFieldStartWithEditingTextProvider).text
        }
      ];
      ref.read(searchTextFieldStartWithEditingTextProvider).clear();
    }
    if (ref.read(searchTextFieldEndWithEditingTextProvider).text != '') {
      ref.read(chipsDataProvider.notifier).state = [
        ...ref.read(chipsDataProvider),
        <String, dynamic>{
          'id': const Uuid().v4(),
          'type': 'endWith',
          'text': ref.read(searchTextFieldEndWithEditingTextProvider).text
        }
      ];
      ref.read(searchTextFieldEndWithEditingTextProvider).clear();
    }
    if (ref.read(searchTextFieldIncludeEditingTextProvider).text != '') {
      ref.read(chipsDataProvider.notifier).state = [
        ...ref.read(chipsDataProvider),
        <String, dynamic>{
          'id': const Uuid().v4(),
          'type': 'include',
          'text': ref.read(searchTextFieldIncludeEditingTextProvider).text
        }
      ];
      ref.read(searchTextFieldIncludeEditingTextProvider).clear();
    }
  }

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
            registChipData(ref);
          },
          child: Scaffold(
            appBar: AppBar(title: const Text('検索する'),),
            body: Column(children: [
              const SearchConditionsForm(),
              ElevatedButton(
                  onPressed: () async {
                    final startWithChipsData = chipsData
                        .where((chipData) => chipData['type'] == 'startWith')
                        .map((startWithChipData) => r'^' + startWithChipData['text'].toString())
                        .toList();
                    final endWithChipsData = chipsData
                        .where((chipData) => chipData['type'] == 'endWith')
                        .map((endWithChipData) => endWithChipData['text'].toString() + r'$')
                        .toList();
                    final includeChipsData = chipsData
                        .where((chipData) => chipData['type'] == 'include')
                        .map((includeChipData) => r'(?=.*' + includeChipData['text'].toString() + r')')
                        .toList();
                    searchNotifier.changeCondition(
                      (startWithChipsData.isNotEmpty ? startWithChipsData.first : '')
                       + (includeChipsData.isNotEmpty ? includeChipsData.join() : '')
                       + r'.*'
                       + (endWithChipsData.isNotEmpty ? endWithChipsData.first : ''));
                    final result = await searchNotifier.search();
                    ref.watch(resultStickiesProvider.notifier).state = result;
                    await ref
                        .watch(stickiesNotifierProvider.notifier)
                        .fetchAll();
                    context.go('/stickiesResult');
                  },
                  child: const Text('検索')),
              const SearchTextFieldStartWith(),
              const SearchTextFieldEndWith(),
              const SearchTextFieldInclude(),
            ]),
          ),
        ));
  }
}

final resultStickiesProvider =
    StateProvider<Stickies>((ref) => Stickies(children: []));

final chipsDataProvider =
    StateProvider<List<Map<String, dynamic>>>((ref) => []);
