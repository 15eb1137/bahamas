import 'package:bahamas/application/app.dart';
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
    final _focusNode = FocusNode();

    return Focus(
        focusNode: _focusNode,
        child: GestureDetector(
            onTap: () async {
              _focusNode.requestFocus();
              if (stickyId == null) {
                await ref.watch(stickyNotifierProvider.notifier).saveNew();
                context.go(
                    '/sticky/${ref.watch(stickyNotifierProvider).id.value}');
              } else {
                await ref.watch(stickyNotifierProvider.notifier).update();
              }
            },
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      StickyTextField(isNew: stickyId == null),
                      const StickyColorPalette()
                    ])),
                floatingActionButton: FloatingActionButton(
                    child: const Icon(Icons.collections),
                    onPressed: (() {
                      context.go('/stickies');
                      ref.read(stickiesNotifierProvider.notifier).fetchAll();
                    })))));
  }
}
