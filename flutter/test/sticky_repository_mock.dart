import 'package:bahamas/domain/domainModel/sticky/stickies.dart';
import 'package:bahamas/domain/domainModel/sticky/sticky.dart';
import 'package:bahamas/domain/domainModel/sticky/value/sticky_id.dart';
import 'package:bahamas/domain/domainService/sticky/sticky_repository.dart';

import 'test_data.dart';

class StickyRepositoryMock implements StickyRepository {
  @override
  Future<Stickies> getAll() async {
    return stickiesTestData;
  }

  @override
  Future<Stickies> getSomeByCreatedAt(
      {required DateTime start, required DateTime end}) async {
    setStickiesGetSomeByCreatedAtTestData();
    return stickiesTestData;
  }

  @override
  Future<Stickies> getSomeByTextCondition(
      {required RegExp textCondition}) async {
    setStickiesGetSomeByTextConditionTestData();
    return stickiesTestData;
  }

  @override
  Future<Sticky> getOneById({required StickyId id}) async {
    setStickyGetOneByIdTestData();
    return stickyTestData;
  }

  @override
  Future<void> remove({required StickyId id}) async {
    setStickiesRemovedTestData();
  }

  @override
  Future<void> saveNew({required Sticky newSticky}) async {
    setStickiesSavedTestData();
  }

  @override
  Future<void> update({required StickyId id, required Sticky newSticky}) async {
    setStickiesUpdatedTestData();
  }
}
