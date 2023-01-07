import 'package:meta/meta.dart';

enum SearchStateType { editing, discarded, fetching, published, failed }

@immutable
class SearchState {
  final SearchStateType value;

  const SearchState(this.value);

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is SearchState && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
