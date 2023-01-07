import 'package:meta/meta.dart';

@immutable
class SearchCondition {
  final RegExp value;

  SearchCondition(this.value) {
    if (value.pattern.isEmpty) {
      throw Exception();
    }
  }
  @override
  bool operator ==(Object other) =>
      identical(other, this) ||
      (other is SearchCondition && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
