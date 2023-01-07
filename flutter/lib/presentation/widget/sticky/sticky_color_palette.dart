import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StickyColorPalette extends ConsumerWidget {
  const StickyColorPalette({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              width: 20,
              decoration: const BoxDecoration(
                  color: Color(0xffff7f7f), shape: BoxShape.circle)),
          Container(
              width: 20,
              decoration: const BoxDecoration(
                  color: Color(0xff7fbfff), shape: BoxShape.circle)),
          Container(
              width: 20,
              decoration: const BoxDecoration(
                  color: Color(0xffffff7f), shape: BoxShape.circle))
        ]),
        width: 100,
        height: 60);
  }
}
