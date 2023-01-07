import 'package:flutter/foundation.dart';

import '../../sticky/stickies.dart';

@immutable
class SearchResult {
  final Stickies value;

  SearchResult(this.value) {
    if (value.length > 10000) {
      Exception();
    }
  }

  @override
  bool operator ==(Object other) => (other is SearchResult &&
      listEquals(other.value.children, value.children));

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
