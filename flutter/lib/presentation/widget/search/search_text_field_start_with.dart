import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../page/search_page.dart';

class SearchTextFieldStartWith extends ConsumerWidget {
  const SearchTextFieldStartWith({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ref.watch(searchTextFieldStartWithEditingTextProvider);
    return Row(children: [
      const CircleAvatar(backgroundColor: Colors.red, child: Icon(Icons.start)),
      Expanded(
          child: TextField(
        controller: _controller,
        onSubmitted: (_) => const SearchPage().registChipData(ref),
      )),
      const Text('から始まる')
    ]);
  }
}

// replace to Search Conditions Domain
final searchTextFieldStartWithEditingTextProvider =
    StateProvider<TextEditingController>(
        (ref) => TextEditingController(text: ''));
