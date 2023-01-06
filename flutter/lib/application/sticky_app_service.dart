import 'package:bahamas/domain/domainModel/stickies.dart';
import 'package:bahamas/domain/domainModel/value/sticky_id.dart';
import 'package:bahamas/domain/domainService/sticky_repository_interface.dart';

import '../domain/domainModel/sticky.dart';

class StickyAppService {
  final StickyRepository _repository;
  StickyAppService({required StickyRepository repository})
      : _repository = repository;

  Future<void> saveNew(Sticky newSticky) async {
    await _repository.saveNew(newSticky);
  }

  Future<void> update(Sticky newSticky) async {
    await _repository.update(newSticky.id, newSticky);
  }

  Future<void> remove(Sticky targetSticky) async {
    await _repository.remove(targetSticky.id);
  }

  Future<Stickies> getAll() async {
    return await _repository.getAll();
  }

  Future<Sticky> getOneById(StickyId id) async {
    return await _repository.getOneById(id);
  }

  Future<Stickies> getSomeByTextCondition(String textCondition) async {
    return await _repository.getSomeByTextCondition(textCondition);
  }

  Future<Stickies> getSomeByCreatedAt(DateTime createdAt) async {
    return await _repository.getSomeByCreatedAt(createdAt);
  }
}
