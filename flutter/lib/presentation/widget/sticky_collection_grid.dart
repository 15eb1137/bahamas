import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/logger.dart';
import '../../domain/domainModel/stickies.dart';

class StickyCollectionGrid extends ConsumerWidget {
  const StickyCollectionGrid(this.stickies, {super.key});

  final Stickies stickies;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
        itemCount: stickies.length,
        padding: const EdgeInsets.all(8),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: ((context, index) {
          final sticky = stickies[index];
          return _gridItem(context, sticky.text.value, sticky.color.value);
        }));
  }

  Widget _gridItem(BuildContext context, String text, Color color) {
    double getRandomAngleDegree(double maxDegreeAbs) =>
        maxDegreeAbs * (Random().nextDouble() - 0.5) * 2;
    double transformDegreeToRadian(double degree) => degree * (pi / 180);
    final angleDegree = getRandomAngleDegree(10);
    logger.i('$text: ${angleDegree.round()}°');
    return GridTile(
        child: Transform.rotate(
            angle: transformDegreeToRadian(angleDegree),
            child: GestureDetector(
                onTap: () => context.go('/sticky'),
                child: Container(
                  color: color,
                  padding: const EdgeInsets.all(9),
                  child: Text(text),
                ))));
  }
}
