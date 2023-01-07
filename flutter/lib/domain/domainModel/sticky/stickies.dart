import 'sticky.dart';

class Stickies {
  final List<Sticky> children;

  Stickies({required this.children});

  int get length => children.length;

  Sticky operator [](int index) => children[index];
}
