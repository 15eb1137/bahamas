import 'dart:ui';

import '../domain/domainModel/stickies.dart';
import '../domain/domainModel/sticky.dart';
import '../domain/domainModel/value/sticky_color.dart';
import '../domain/domainModel/value/sticky_font_size.dart';
import '../domain/domainModel/value/sticky_id.dart';
import '../domain/domainModel/value/sticky_last_edit.dart';
import '../domain/domainModel/value/sticky_state.dart';
import '../domain/domainModel/value/sticky_text.dart';
import '../domain/domainService/sticky_repository_interface.dart';

class StickyRepositoryMock implements StickyRepository {
  @override
  Future<Stickies> getAll() async => Stickies(children: [
        Sticky(
            id: StickyId('GetAllTestId01'),
            text: StickyText('GetAllTestText01'),
            fontSize: StickyFontSize(16),
            lastEdit: StickyLastEdit(DateTime(2023, 1, 1, 0, 0, 0)),
            color: StickyColor(const Color(0xffff7f7f)),
            state: const StickyState(StickyStateType.editing)),
        Sticky(
            id: StickyId('GetAllTestId02'),
            text: StickyText('GetAllTestText02'),
            fontSize: StickyFontSize(18),
            lastEdit: StickyLastEdit(DateTime(2023, 1, 2, 5, 30, 10)),
            color: StickyColor(const Color(0xff7fbfff)),
            state: const StickyState(StickyStateType.archived))
      ]);

  @override
  Future<Stickies> getSomeByCreatedAt(DateTime createdAt) async =>
      Stickies(children: [
        Sticky(
            id: StickyId('ByCreatedAtTestId01'),
            text: StickyText('ByCreatedAtTestText01'),
            fontSize: StickyFontSize(16),
            lastEdit: StickyLastEdit(DateTime(2023, 1, 1, 0, 0, 0)),
            color: StickyColor(const Color(0xffff7f7f)),
            state: const StickyState(StickyStateType.editing)),
        Sticky(
            id: StickyId('ByCreatedAtTestId02'),
            text: StickyText('ByCreatedAtTestText02'),
            fontSize: StickyFontSize(18),
            lastEdit: StickyLastEdit(DateTime(2023, 1, 2, 5, 30, 10)),
            color: StickyColor(const Color(0xff7fbfff)),
            state: const StickyState(StickyStateType.archived))
      ]);

  @override
  Future<Stickies> getSomeByTextCondition(String textCondition) async =>
      Stickies(children: [
        Sticky(
            id: StickyId('ByTextConditionTestId01'),
            text: StickyText('ByTextConditionTestText01'),
            fontSize: StickyFontSize(16),
            lastEdit: StickyLastEdit(DateTime(2023, 1, 1, 0, 0, 0)),
            color: StickyColor(const Color(0xffff7f7f)),
            state: const StickyState(StickyStateType.editing)),
        Sticky(
            id: StickyId('ByTextConditionTestId02'),
            text: StickyText('ByTextConditionTestText02'),
            fontSize: StickyFontSize(18),
            lastEdit: StickyLastEdit(DateTime(2023, 1, 2, 5, 30, 10)),
            color: StickyColor(const Color(0xff7fbfff)),
            state: const StickyState(StickyStateType.archived))
      ]);

  @override
  Future<Sticky> getOneById(StickyId id) async => Sticky(
      id: StickyId('ByIdTestId01'),
      text: StickyText('ByIdTestText01'),
      fontSize: StickyFontSize(16),
      lastEdit: StickyLastEdit(DateTime(2023, 1, 1, 0, 0, 0)),
      color: StickyColor(const Color(0xffff7f7f)),
      state: const StickyState(StickyStateType.editing));

  @override
  Future<void> remove(StickyId id) async {}

  @override
  Future<void> saveNew(Sticky newSticky) async {}

  @override
  Future<void> update(StickyId id, Sticky newSticky) async {}
}
