import 'package:meta/meta.dart';

@immutable
class SearchPublishedAt {
  final DateTime? value;

  SearchPublishedAt(this.value) {
    if (value != null && value!.isAfter(DateTime.now())) {
      throw Exception();
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(other, this) ||
      (other is SearchPublishedAt && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
