import '../../domainModel/sticky/stickies.dart';
import '../../domainModel/sticky/sticky.dart';
import '../../domainModel/sticky/value/sticky_id.dart';

// abstract? interface
class StickyRepository {
  StickyRepository();

  Future<void> saveNew({required Sticky newSticky}) async => throw Exception();
  Future<void> update(
          {required StickyId id, required Sticky newSticky}) async =>
      throw Exception();
  Future<void> remove({required StickyId id}) async => throw Exception();
  Future<Stickies> getAll() async => throw Exception();
  Future<Sticky> getOneById({required StickyId id}) async => throw Exception();
  Future<Stickies> getSomeByTextCondition(
          {required RegExp textCondition}) async =>
      throw Exception();
  Future<Stickies> getSomeByCreatedAt(
          {required DateTime start, required DateTime end}) async =>
      throw Exception();
}
