import 'package:isar/isar.dart';

part 'sticky_isar_collection.g.dart';

@Collection(accessor: 'stickies')
class StickyIsarCollection {
  late String id;

  Id get isarId => fastHash(id);

  late String text;

  late int fontSize;

  @Index()
  late DateTime lastEdit;

  late int color;

  // @enumerated
  // late StickyState state;

  int fastHash(String string) {
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < string.length) {
      final codeUnit = string.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }
}
