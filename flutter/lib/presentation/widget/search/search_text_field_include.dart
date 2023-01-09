import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../page/search_page.dart';

class SearchTextFieldInclude extends ConsumerWidget {
  const SearchTextFieldInclude({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ref.watch(searchTextFieldIncludeEditingTextProvider);
    return Row(children: [
      const CircleAvatar(
          backgroundColor: Colors.green, child: Icon(Icons.unfold_more)),
      Expanded(
          child: TextField(
        controller: _controller,
        onSubmitted: (_) => const SearchPage().registChipData(ref),
      )),
      const Text('を含む')
    ]);
  }
}

// replace to Search Conditions Domain
final searchTextFieldIncludeEditingTextProvider =
    StateProvider<TextEditingController>(
        (ref) => TextEditingController(text: ''));
