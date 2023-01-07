import 'package:flutter/material.dart';

abstract class SearchBadge extends StatelessWidget {
  const SearchBadge({super.key});

  @override
  Widget build(BuildContext context) => Container(
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: _circleColor()),
        width: _circleSize(),
        height: _circleSize(),
        child: _badgeIcon(),
      );

  Icon _badgeIcon();
  Color _circleColor();
  double _circleSize();
}

class SearchBadgeStartWith extends SearchBadge {
  final double size;

  const SearchBadgeStartWith({super.key, required this.size});

  @override
  Icon _badgeIcon() => const Icon(Icons.start);

  @override
  Color _circleColor() => Colors.red;

  @override
  double _circleSize() => size;
}

class SearchBadgeEndWith extends SearchBadge {
  final double size;

  const SearchBadgeEndWith({super.key, required this.size});

  @override
  Icon _badgeIcon() => const Icon(Icons.keyboard_tab);

  @override
  Color _circleColor() => Colors.yellow;

  @override
  double _circleSize() => size;
}

class SearchBadgeExclude extends SearchBadge {
  final double size;

  const SearchBadgeExclude({super.key, required this.size});

  @override
  Icon _badgeIcon() => const Icon(Icons.unfold_less);

  @override
  Color _circleColor() => Colors.purple;

  @override
  double _circleSize() => size;
}

class SearchBadgeInclude extends SearchBadge {
  final double size;

  const SearchBadgeInclude({super.key, required this.size});

  @override
  Icon _badgeIcon() => const Icon(Icons.unfold_more);

  @override
  Color _circleColor() => Colors.green;

  @override
  double _circleSize() => size;
}
