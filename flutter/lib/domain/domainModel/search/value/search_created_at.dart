import 'package:meta/meta.dart';

@immutable
class SearchCreatedAt {
  final DateTime value;

  SearchCreatedAt(this.value) {
    if (value.isAfter(DateTime.now())) {
      throw Exception();
    }
  }

    @override
  bool operator ==(Object other) =>
      identical(other, this) ||
      (other is SearchCreatedAt && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
