
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../notifier/sticky/stickies_notifier.dart';
import '../widget/sticky/sticky_collection_grid.dart';
import 'search_page.dart';

class StickyCollectionPage extends ConsumerWidget {
  final bool isResult;

  const StickyCollectionPage({super.key, this.isResult = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stickies = ref.watch(stickiesNotifierProvider);
    return Scaffold(
      body: Column(children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Padding(
                padding: const EdgeInsets.all(24),
                child: ElevatedButton(
                    onPressed: () => context.go('/search'),
                    child: const Text('メモを検索')))),
        Expanded(
            child: StickyCollectionGrid(
                isResult ? ref.read(resultStickiesProvider) : stickies))
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () => context.go('/sticky'), child: const Icon(Icons.add)),
    );
  }
}
