import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/logger.dart';
import '../notifier/sticky/stickies_notifier.dart';
import '../notifier/sticky/sticky_notifier.dart';
import '../widget/sticky/sticky_color_palette.dart';
import '../widget/sticky/sticky_text_field.dart';

class StickySinglePage extends ConsumerWidget {
  final String? stickyId;
  const StickySinglePage({super.key, required this.stickyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logger.i('Here is Sticky single page! (${stickyId ?? 'new sticky'})');
    final selectedStickyText =
        ref.watch(stickyNotifierProvider.select((sticky) => sticky.text));
    StickyTextField textField = const StickyTextField();
    if (stickyId != null) {
      ref.watch(stickyNotifierProvider.notifier).getOneById(stickyId!);
      textField = StickyTextField(initialText: selectedStickyText.value);
    }

    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [textField, const StickyColorPalette()])),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.collections),
            onPressed: (() {
              context.go('/stickies');
              ref.read(stickiesNotifierProvider.notifier).fetchAll();
            })));
  }
}
