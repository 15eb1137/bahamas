import 'dart:ui';

import '../../domain/domainModel/sticky/stickies.dart';
import '../../domain/domainModel/sticky/sticky.dart';
import '../../domain/domainModel/sticky/value/sticky_id.dart';
import '../../domain/domainService/sticky/sticky_repository.dart';

class StickyAppService {
  final StickyRepository _repository;
  StickyAppService({required StickyRepository repository})
      : _repository = repository;

  Future<void> saveNew(String text, int fontSize, DateTime lastEdit,
      Color color, String state) async {
    await _repository.saveNew(Sticky.initial()); // Todo
  }

  Future<void> update(String stickyId, String text, int fontSize,
      DateTime lastEdit, Color color, String state) async {
    final targetId = StickyId(stickyId);
    await _repository.update(targetId, Sticky.initial()); // Todo
  }

  Future<void> remove(String stickyId) async {
    final targetId = StickyId(stickyId);
    await _repository.remove(targetId);
  }

  Future<Stickies> getAll() async {
    return await _repository.getAll();
  }

  Future<Sticky> getOneById(String stickyId) async {
    final targetId = StickyId(stickyId);
    return await _repository.getOneById(targetId);
  }

  Future<Stickies> getSomeByTextCondition(String textCondition) async {
    return await _repository.getSomeByTextCondition(textCondition);
  }

  Future<Stickies> getSomeByCreatedAt(DateTime createdAt) async {
    return await _repository.getSomeByCreatedAt(createdAt);
  }
}
