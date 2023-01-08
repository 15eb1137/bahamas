import 'dart:ui';

import 'package:uuid/uuid.dart';

import '../../domain/domainModel/sticky/stickies.dart';
import '../../domain/domainModel/sticky/sticky.dart';
import '../../domain/domainModel/sticky/value/sticky_color.dart';
import '../../domain/domainModel/sticky/value/sticky_font_size.dart';
import '../../domain/domainModel/sticky/value/sticky_id.dart';
import '../../domain/domainModel/sticky/value/sticky_last_edit.dart';
import '../../domain/domainModel/sticky/value/sticky_state.dart';
import '../../domain/domainModel/sticky/value/sticky_text.dart';
import '../../domain/domainService/sticky/sticky_repository.dart';

class StickyAppService {
  final StickyRepository _repository;
  StickyAppService({required StickyRepository repository})
      : _repository = repository;

  Future<void> saveNew(
      {required String text,
      required int fontSize,
      required DateTime lastEdit,
      required Color color,
      required StickyStateType state}) async {
    await _repository.saveNew(
        newSticky: Sticky(
            id: StickyId(const Uuid().v4()),
            text: StickyText(text),
            fontSize: StickyFontSize(fontSize),
            lastEdit: StickyLastEdit(lastEdit),
            color: StickyColor(color),
            state: StickyState(state)));
  }

  Future<void> update(
      {required String stickyId,
      String? text,
      int? fontSize,
      DateTime? lastEdit,
      Color? color,
      StickyStateType? state}) async {
    final targetId = StickyId(stickyId);
    final targetSticky = await _repository.getOneById(id: targetId);
    if (text != null) {
      targetSticky.changeText(StickyText(text));
    }
    if (fontSize != null) {
      targetSticky.changeFontSize(StickyFontSize(fontSize));
    }
    if (lastEdit != null) {
      targetSticky.changeLastEdit(StickyLastEdit(lastEdit));
    }
    if (color != null) {
      targetSticky.changeColor(StickyColor(color));
    }
    if (state != null) {
      targetSticky.changeState(StickyState(state));
    }

    await _repository.update(id: targetId, newSticky: targetSticky);
  }

  Future<void> remove({required String stickyId}) async {
    final targetId = StickyId(stickyId);
    await _repository.remove(id: targetId);
  }

  Future<Stickies> getAll() async {
    return await _repository.getAll();
  }

  Future<Sticky> getOneById({required String stickyId}) async {
    final targetId = StickyId(stickyId);
    return await _repository.getOneById(id: targetId);
  }

  Future<Stickies> getSomeByTextCondition(
      {required RegExp textCondition}) async {
    return await _repository.getSomeByTextCondition(
        textCondition: textCondition);
  }

  Future<Stickies> getSomeByCreatedAt(
      {required DateTime start, required DateTime end}) async {
    return await _repository.getSomeByCreatedAt(start: start, end: end);
  }
}
