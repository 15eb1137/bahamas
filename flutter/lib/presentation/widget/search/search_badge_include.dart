import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../page/search_page.dart';

class SearchBadgeInclude extends ConsumerWidget {
  final String id;
  final String text;
  const SearchBadgeInclude({super.key, required this.id, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) => InputChip(
        padding: const EdgeInsets.all(2.0),
        avatar: const CircleAvatar(
            backgroundColor: Colors.green, child: Icon(Icons.unfold_more)),
        label: Text(text),
        onDeleted: () {
          ref.read(chipsDataProvider.notifier).state = ref
              .read(chipsDataProvider)
              .where((chipData) => chipData['id'] != id)
              .toList();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('検索条件を外しました。')));
        },
      );
}
