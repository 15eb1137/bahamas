import 'package:meta/meta.dart';

import '../../search/value/search_condition.dart';

@immutable
class StickyText {
  final String value;

  StickyText(this.value) {
    if (value.length > 300) {
      throw Exception();
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is StickyText && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;

  bool contains(SearchCondition other, [int startIndex = 0]) =>
      value.contains(other.value, startIndex);
}
