import 'package:bahamas/presentation/notifier/sticky/sticky_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/logger.dart';

class StickyTextField extends ConsumerStatefulWidget {
  final bool isNew;

  const StickyTextField({super.key, required this.isNew});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => StickyTextFieldState();
}

class StickyTextFieldState extends ConsumerState<StickyTextField> {
  bool isTurning = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const animationDuration = Duration(seconds: 1);
    final selectedStickyText = ref.read(stickyNotifierProvider).text;

    final _controller = TextEditingController(
        text: widget.isNew ? '' : selectedStickyText.value);
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomLeft,
        children: [
          ..._backgroundStickies(),
          AnimatedPositioned(
            top: !isTurning ? 0 : -600,
            duration: animationDuration,
            child: Stack(alignment: Alignment.bottomLeft, children: [
              Container(
                  color: const Color(0xffff7f7f),
                  child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                          controller: _controller,
                          expands: true,
                          maxLength: 150,
                          maxLines: null,
                          cursorColor: Colors.white,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          style: const TextStyle(fontSize: 18),
                          onChanged: (value) => ref
                              .watch(stickyNotifierProvider.notifier)
                              .changeText(value))),
                  height: 300,
                  width: 300),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      isTurning = true;
                    });
                    Future<void>.delayed(
                        animationDuration, () => context.go('/sticky/new'));
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                      color: const Color(0xffcc6666), width: 60, height: 60),
                  onVerticalDragUpdate: (details) {
                    final dy = details.delta.dy;
                    if (dy < -10) {
                      logger.i('dy: $dy');
                    }
                  }),
            ]),
          )
        ]);
  }

  List<Widget> _backgroundStickies() => [
        Container(color: const Color(0xffff7f7f), height: 300, width: 300),
        Container(color: const Color(0xffcc6666), width: 60, height: 60)
      ];
}
