import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widget/sticky/sticky_color_palette.dart';
import '../widget/sticky/sticky_text_field.dart';

class StickySinglePage extends ConsumerWidget {
  final String stickyId;
  const StickySinglePage({super.key, required this.stickyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [StickyTextField(), StickyColorPalette()])),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.collections),
            onPressed: (() => context.go('/stickies'))));
  }
}
