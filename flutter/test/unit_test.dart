import 'dart:ui';

import 'package:bahamas/application/sticky/sticky_app_service.dart';
import 'package:bahamas/domain/domainModel/sticky/stickies.dart';
import 'package:bahamas/domain/domainModel/sticky/sticky.dart';
import 'package:bahamas/domain/domainModel/sticky/value/sticky_color.dart';
import 'package:bahamas/domain/domainModel/sticky/value/sticky_font_size.dart';
import 'package:bahamas/domain/domainModel/sticky/value/sticky_id.dart';
import 'package:bahamas/domain/domainModel/sticky/value/sticky_last_edit.dart';
import 'package:bahamas/domain/domainModel/sticky/value/sticky_state.dart';
import 'package:bahamas/domain/domainModel/sticky/value/sticky_text.dart';
import 'package:flutter_test/flutter_test.dart';

import 'isar_test_helper.dart';
import 'sticky_repository_mock.dart';
import 'test_data.dart';

void main() {
  final _isarHelper = IsarTestHelper();
  setUp(_isarHelper.setUp);
  tearDown(_isarHelper.tearDown);

  test('Stickies AppService Tests', () async {
    final appService = StickyAppService(repository: StickyRepositoryMock());
    resetStickiesTestData();

    final resultGetAll = await appService.getAll();
    expect(resultGetAll, stickiesDefaultTestData);

    final resultGetSomeByCreatedAt = await appService.getSomeByCreatedAt(
        start: DateTime(2022, 10, 1), end: DateTime(2023, 1, 1));
    expect(resultGetSomeByCreatedAt, stickiesGetSomeByCreatedAtTestData);

    final resultGetSomeByTextCondition =
        await appService.getSomeByTextCondition(textCondition: RegExp(r'test'));
    expect(
        resultGetSomeByTextCondition, stickiesGetSomeByTextConditionTestData);

    final resultGetOneById = await appService.getOneById(stickyId: 'testId');
    expect(resultGetOneById, stickyGetOneByIdTestData);

    resetStickiesTestData();
    await appService.remove(stickyId: 'TestId01');
    final resultRemoved = await appService.getAll();
    final expectedRemoved = Stickies(
        children: stickiesDefaultTestData.children
            .where((sticky) => sticky.id.value != 'TestId01')
            .toList());
    expect(resultRemoved, expectedRemoved);

    resetStickiesTestData();
    await appService.saveNew(
        text: newSavedSticy.text.value,
        fontSize: newSavedSticy.fontSize.value,
        lastEdit: newSavedSticy.lastEdit.value,
        color: newSavedSticy.color.value,
        state: newSavedSticy.state.value);
    final resultSaved = await appService.getAll();
    final expectedSaved = Stickies(
        children: [...stickiesDefaultTestData.children, newSavedSticy]);
    expect(resultSaved, expectedSaved);

    resetStickiesTestData();
    await appService.update(
        stickyId: 'TestId01',
        text: 'Updated Text',
        lastEdit: DateTime(2023, 1, 8, 11, 42, 32));
    final resultUpdated = await appService.getAll();
    final expectedUpdated = Stickies(
        children: stickiesDefaultTestData.children
            .map((sticky) => sticky.id.value == 'TestId01'
                ? Sticky(
                    id: sticky.id,
                    text: StickyText('Updated Text'),
                    fontSize: sticky.fontSize,
                    lastEdit: StickyLastEdit(DateTime(2023, 1, 8, 11, 42, 32)),
                    color: sticky.color,
                    state: sticky.state)
                : sticky)
            .toList());
    expect(resultUpdated, expectedUpdated); // bug?
    expect(resultUpdated.children.first.id, expectedUpdated.children.first.id);
    expect(
        resultUpdated.children.first.text, expectedUpdated.children.first.text);
    expect(resultUpdated.children.first.lastEdit,
        expectedUpdated.children.first.lastEdit);
  });

  test('Stickies Isar Repository Tests', () async {
    final repository = _isarHelper.getStickyRepository();

    final stickiesGetAll = await repository.getAll();
    expect(stickiesGetAll.length, 2);

    // final stickiesGetByCreatedAt = repository.getSomeByCreatedAt(
    //     start: DateTime(2022, 10, 1), end: DateTime(2023, 1, 1));
    // expect(actual, matcher);

    // final stickiesGetByTextCondition =
    //     repository.getSomeByTextCondition(textCondition: RegExp(r'test'));
    // expect(actual, matcher);

    final stickyGetById = await repository.getOneById(id: StickyId('TestId01'));
    expect(stickyGetById, stickiesDefaultTestData.children.first);

    await repository.saveNew(newSticky: newSavedSticy);
    final stickiesGetAllSaved = await repository.getAll();
    expect(stickiesGetAllSaved.length, 3);

    await repository.update(
        id: StickyId('TestId01'),
        newSticky: Sticky(
            id: StickyId('TestId01'),
            text: StickyText('Updated Text'),
            fontSize: StickyFontSize(16),
            lastEdit: StickyLastEdit(DateTime(2023, 1, 8, 11, 42, 32)),
            color: StickyColor(const Color(0xffff7f7f)),
            state: const StickyState(StickyStateType.editing)));
    final stickyGetByIdUpdated =
        await repository.getOneById(id: StickyId('TestId01'));
    expect(stickyGetByIdUpdated, stickiesUpdatedTestData.children.first);
  });
}
