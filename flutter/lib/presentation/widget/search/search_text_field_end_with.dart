import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../page/search_page.dart';

class SearchTextFieldEndWith extends ConsumerWidget {
  const SearchTextFieldEndWith({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ref.watch(searchTextFieldEndWithEditingTextProvider);
    return Row(children: [
      const CircleAvatar(
          backgroundColor: Colors.yellow, child: Icon(Icons.keyboard_tab)),
      Expanded(
          child: TextField(
        controller: _controller,
        onSubmitted: (_) => const SearchPage().registChipData(ref),
      )),
      const Text('で終わる')
    ]);
  }
}

// replace to Search Conditions Domain
final searchTextFieldEndWithEditingTextProvider =
    StateProvider<TextEditingController>(
        (ref) => TextEditingController(text: ''));
