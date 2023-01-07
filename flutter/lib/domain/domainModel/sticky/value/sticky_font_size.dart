import 'package:meta/meta.dart';

@immutable
class StickyFontSize {
  final int value;

  StickyFontSize(this.value) {
    if (value < 9 || value > 24) {
      throw Exception();
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(other, this) ||
      (other is StickyFontSize && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
