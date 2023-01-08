import 'dart:ui';


import 'package:isar/isar.dart';

import '../../domain/domainModel/sticky/stickies.dart';
import '../../domain/domainModel/sticky/sticky.dart';
import '../../domain/domainModel/sticky/value/sticky_color.dart';
import '../../domain/domainModel/sticky/value/sticky_font_size.dart';
import '../../domain/domainModel/sticky/value/sticky_id.dart';
import '../../domain/domainModel/sticky/value/sticky_last_edit.dart';
import '../../domain/domainModel/sticky/value/sticky_state.dart';
import '../../domain/domainModel/sticky/value/sticky_text.dart';
import '../../domain/domainService/sticky/sticky_repository.dart';
import 'sticky_isar_collection.dart';

class StickyRepositoryIsar implements StickyRepository {
  final Isar _instance;

  StickyRepositoryIsar({required Isar instance}) : _instance = instance;

  void dispose() {}

  @override
  Future<Stickies> getAll() async {
    if (!_instance.isOpen) {
      return Stickies(children: []);
    }
    final result =
        await _instance.collection<StickyIsarCollection>().where().findAll();
    return Stickies(
        children: result
            .map((sticky) => Sticky(
                id: StickyId(sticky.id),
                text: StickyText(sticky.text),
                fontSize: StickyFontSize(sticky.fontSize),
                lastEdit: StickyLastEdit(sticky.lastEdit),
                color: StickyColor(Color(sticky.color)),
                state: const StickyState(StickyStateType.editing)))
            .toList());
  }

  @override
  Future<Sticky> getOneById({required StickyId id}) async {
    final isarId = StickyIsarCollection().fastHash(id.value);
    if (!_instance.isOpen) {
      return Sticky.initial();
    }
    final result = await _instance.stickies.get(isarId);
    if (result == null) {
      return Sticky.initial();
    }
    return Sticky(
        id: StickyId(result.id),
        text: StickyText(result.text),
        fontSize: StickyFontSize(result.fontSize),
        lastEdit: StickyLastEdit(result.lastEdit),
        color: StickyColor(Color(result.color)),
        state: const StickyState(StickyStateType.editing));
  }

  @override
  Future<Stickies> getSomeByCreatedAt(
      {required DateTime start, required DateTime end}) {
    // TODO: implement getSomeByCreatedAt
    throw UnimplementedError();
  }

  @override
  Future<Stickies> getSomeByTextCondition({required RegExp textCondition}) {
    // TODO: implement getSomeByTextCondition
    throw UnimplementedError();
  }

  @override
  Future<void> remove({required StickyId id}) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<void> saveNew({required Sticky newSticky}) async {
    if (!_instance.isOpen) {
      throw Exception();
    }
    final newIsarSticky = StickyIsarCollection()
      ..id = newSticky.id.value
      ..text = newSticky.text.value
      ..fontSize = newSticky.fontSize.value
      ..lastEdit = newSticky.lastEdit.value
      ..color = newSticky.color.value.value;
    await _instance
        .writeTxn(() async => await _instance.stickies.put(newIsarSticky));
  }

  @override
  Future<void> update({required StickyId id, required Sticky newSticky}) async {
    if (!_instance.isOpen) {
      throw Exception();
    }
    final newIsarSticky = StickyIsarCollection()
      ..id = newSticky.id.value
      ..text = newSticky.text.value
      ..fontSize = newSticky.fontSize.value
      ..lastEdit = newSticky.lastEdit.value
      ..color = newSticky.color.value.value;
    await _instance
        .writeTxn(() async => await _instance.stickies.put(newIsarSticky));
  }
}
