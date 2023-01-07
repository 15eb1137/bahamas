// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/search/search_badge_start_with.dart';
import '../widget/search/search_text_field_start_with.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(children: [
        SearchBadgeStartWith(
          text: '毎日メモ',
        ),
        SearchTextFieldStartWith(
          addStartWithChip: (text) {},
        )
      ]),
    );
  }
}
