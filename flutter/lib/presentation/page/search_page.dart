import 'package:bahamas/presentation/widget/search/search_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(children: const [
        SearchBadgeStartWith(size: 50),
        SearchBadgeEndWith(size: 50),
        SearchBadgeInclude(size: 50),
        SearchBadgeExclude(size: 50)
      ]),
    );
  }
}
