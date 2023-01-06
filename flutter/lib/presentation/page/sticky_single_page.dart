import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/sticky_color_palette.dart';
import '../widget/sticky_text_field.dart';

class StickySinglePage extends ConsumerWidget {
  final String stickyId;
  const StickySinglePage({super.key, required this.stickyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [StickyTextField(), StickyColorPalette()])));
  }
}
