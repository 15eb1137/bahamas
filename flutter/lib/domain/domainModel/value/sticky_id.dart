import 'package:meta/meta.dart';

@immutable
class StickyId {
  final String value;

  StickyId(this.value) {
    if (value.isEmpty) {
      throw Exception();
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is StickyId && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
