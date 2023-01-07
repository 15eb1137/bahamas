import '../../domainModel/sticky/stickies.dart';
import '../../domainModel/sticky/sticky.dart';
import '../../domainModel/sticky/value/sticky_id.dart';

// abstract?
class StickyRepository {
  StickyRepository();

  Future<void> saveNew(Sticky newSticky) async => throw Exception();
  Future<void> update(StickyId id, Sticky newSticky) async => throw Exception();
  Future<void> remove(StickyId id) async => throw Exception();
  Future<Stickies> getAll() async => throw Exception();
  Future<Sticky> getOneById(StickyId id) async => throw Exception();
  Future<Stickies> getSomeByTextCondition(String textCondition) async =>
      throw Exception();
  Future<Stickies> getSomeByCreatedAt(DateTime createdAt) async =>
      throw Exception();
}
