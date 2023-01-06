import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StickyTextField extends ConsumerWidget {
  const StickyTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) {
      print('loaded');
    }
    return Stack(alignment: Alignment.bottomRight, children: [
      Container(
          color: const Color(0xffff7f7f),
          child: const Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                  expands: true,
                  maxLines: null,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(border: InputBorder.none),
                  style: TextStyle(fontSize: 18))),
          height: 300,
          width: 300),
      GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Container(
              color: const Color(0xffcc6666), width: 60, height: 60),
          onVerticalDragUpdate: (details) {
            if (kDebugMode) {
              print('dy: ${details.delta.dy}');
            }
          })
    ]);
  }
}
