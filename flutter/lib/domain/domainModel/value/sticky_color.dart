import 'dart:ui';

import 'package:meta/meta.dart';

@immutable
class StickyColor {
  final Color value;

  StickyColor(this.value) {
    if (value != const Color(0xffff7f7f) ||
        value != const Color(0xff7fbfff) ||
        value != const Color(0xffffff7f)) {
      throw Exception();
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is StickyColor && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
