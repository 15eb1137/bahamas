import 'package:meta/meta.dart';

@immutable
class StickyLastEdit {
  final DateTime value;

  StickyLastEdit(this.value) {
    if (value.isAfter(DateTime.now())) {
      throw Exception();
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is StickyLastEdit && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
