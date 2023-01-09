import 'package:flutter/cupertino.dart';

class StickyColorPalette extends StatelessWidget {
  const StickyColorPalette({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              width: 20,
              decoration: const BoxDecoration(
                  color: Color(0xffff7f7f), shape: BoxShape.circle)),
          Container(
              width: 20,
              decoration: const BoxDecoration(
                  color: Color(0xffff7f7f), shape: BoxShape.circle)),
          Container(
              width: 20,
              decoration: const BoxDecoration(
                  color: Color(0xffff7f7f), shape: BoxShape.circle)),
          // Container(
          //     width: 20,
          //     decoration: const BoxDecoration(
          //         color: Color(0xff7fbfff), shape: BoxShape.circle)),
          // Container(
          //     width: 20,
          //     decoration: const BoxDecoration(
          //         color: Color(0xffffff7f), shape: BoxShape.circle))
        ]),
        width: 100,
        height: 60);
  }
}
