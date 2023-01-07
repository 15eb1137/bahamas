import 'package:meta/meta.dart';

@immutable
class SearchId {
  final String value;

  SearchId(this.value) {
    if (value.isEmpty) {
      throw Exception();
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is SearchId && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
