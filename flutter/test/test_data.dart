import 'dart:ui';

import 'package:bahamas/domain/domainModel/sticky/stickies.dart';
import 'package:bahamas/domain/domainModel/sticky/sticky.dart';
import 'package:bahamas/domain/domainModel/sticky/value/sticky_color.dart';
import 'package:bahamas/domain/domainModel/sticky/value/sticky_font_size.dart';
import 'package:bahamas/domain/domainModel/sticky/value/sticky_id.dart';
import 'package:bahamas/domain/domainModel/sticky/value/sticky_last_edit.dart';
import 'package:bahamas/domain/domainModel/sticky/value/sticky_state.dart';
import 'package:bahamas/domain/domainModel/sticky/value/sticky_text.dart';

Sticky stickyTestData = stickiesDefaultTestData.children.first;
Stickies stickiesTestData = stickiesDefaultTestData;
final stickiesDefaultTestData = Stickies(children: [
  Sticky(
      id: StickyId('TestId01'),
      text: StickyText('TestText01'),
      fontSize: StickyFontSize(16),
      lastEdit: StickyLastEdit(DateTime(2023, 1, 1, 0, 0, 0)),
      color: StickyColor(const Color(0xffff7f7f)),
      state: const StickyState(StickyStateType.editing)),
  Sticky(
      id: StickyId('TestId02'),
      text: StickyText('TestText02'),
      fontSize: StickyFontSize(18),
      lastEdit: StickyLastEdit(DateTime(2023, 1, 2, 5, 30, 10)),
      color: StickyColor(const Color(0xff7fbfff)),
      state: const StickyState(StickyStateType.archived))
]);
void resetStickiesTestData() => stickiesTestData = stickiesDefaultTestData;

void setStickiesGetSomeByCreatedAtTestData() =>
    stickiesTestData = stickiesGetSomeByCreatedAtTestData;
void setStickiesGetSomeByTextConditionTestData() =>
    stickiesTestData = stickiesGetSomeByTextConditionTestData;
void setStickyGetOneByIdTestData() => stickyTestData = stickyGetOneByIdTestData;
void setStickiesRemovedTestData() => stickiesTestData = stickiesRemovedTestData;
void setStickiesSavedTestData() => stickiesTestData = stickiesSavedTestData;
void setStickiesUpdatedTestData() => stickiesTestData = stickiesUpdatedTestData;

final stickiesGetSomeByCreatedAtTestData = Stickies(children: [
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

final stickiesGetSomeByTextConditionTestData = Stickies(children: [
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

final stickyGetOneByIdTestData = Sticky(
    id: StickyId('ByIdTestId01'),
    text: StickyText('ByIdTestText01'),
    fontSize: StickyFontSize(16),
    lastEdit: StickyLastEdit(DateTime(2023, 1, 1, 0, 0, 0)),
    color: StickyColor(const Color(0xffff7f7f)),
    state: const StickyState(StickyStateType.editing));

final stickiesRemovedTestData = Stickies(children: [
  Sticky(
      id: StickyId('TestId02'),
      text: StickyText('TestText02'),
      fontSize: StickyFontSize(18),
      lastEdit: StickyLastEdit(DateTime(2023, 1, 2, 5, 30, 10)),
      color: StickyColor(const Color(0xff7fbfff)),
      state: const StickyState(StickyStateType.archived))
]);

final stickiesSavedTestData = Stickies(children: [
  Sticky(
      id: StickyId('TestId01'),
      text: StickyText('TestText01'),
      fontSize: StickyFontSize(16),
      lastEdit: StickyLastEdit(DateTime(2023, 1, 1, 0, 0, 0)),
      color: StickyColor(const Color(0xffff7f7f)),
      state: const StickyState(StickyStateType.editing)),
  Sticky(
      id: StickyId('TestId02'),
      text: StickyText('TestText02'),
      fontSize: StickyFontSize(18),
      lastEdit: StickyLastEdit(DateTime(2023, 1, 2, 5, 30, 10)),
      color: StickyColor(const Color(0xff7fbfff)),
      state: const StickyState(StickyStateType.archived)),
  Sticky(
      id: StickyId('testId'),
      text: StickyText('TestText'),
      fontSize: StickyFontSize(16),
      lastEdit: StickyLastEdit(DateTime(2022, 10, 1)),
      color: StickyColor(const Color(0xffff7f7f)),
      state: const StickyState(StickyStateType.editing))
]);

final newSavedSticy = Sticky(
    id: StickyId('testId'),
    text: StickyText('TestText'),
    fontSize: StickyFontSize(16),
    lastEdit: StickyLastEdit(DateTime(2022, 10, 1)),
    color: StickyColor(const Color(0xffff7f7f)),
    state: const StickyState(StickyStateType.editing));

final stickiesUpdatedTestData = Stickies(children: [
  Sticky(
      id: StickyId('TestId01'),
      text: StickyText('Updated Text'),
      fontSize: StickyFontSize(16),
      lastEdit: StickyLastEdit(DateTime(2023, 1, 8, 11, 42, 32)),
      color: StickyColor(const Color(0xffff7f7f)),
      state: const StickyState(StickyStateType.editing)),
  Sticky(
      id: StickyId('TestId02'),
      text: StickyText('TestText02'),
      fontSize: StickyFontSize(18),
      lastEdit: StickyLastEdit(DateTime(2023, 1, 2, 5, 30, 10)),
      color: StickyColor(const Color(0xff7fbfff)),
      state: const StickyState(StickyStateType.archived)),
]);
