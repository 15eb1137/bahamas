import 'package:flutter/foundation.dart';

import 'sticky.dart';

class Stickies {
  List<Sticky> _children;

  Stickies({required List<Sticky> children}) : _children = children;

  List<Sticky> get children => _children;
  int get length => _children.length;

  Sticky operator [](int index) => _children[index];

  @override
  bool operator ==(Object other) =>
      other is Stickies && listEquals(other._children, _children);

  @override
  int get hashCode => runtimeType.hashCode ^ _children.hashCode;

  void add(Sticky value) => _children = [..._children, value];
}
