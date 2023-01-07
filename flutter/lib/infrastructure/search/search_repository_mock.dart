import 'dart:ui';

import '../../domain/domainModel/search/search.dart';
import '../../domain/domainModel/search/value/search_condition.dart';
import '../../domain/domainModel/search/value/search_created_at.dart';
import '../../domain/domainModel/search/value/search_id.dart';
import '../../domain/domainModel/search/value/search_published_at.dart';
import '../../domain/domainModel/search/value/search_result.dart';
import '../../domain/domainModel/search/value/search_state.dart';
import '../../domain/domainModel/sticky/stickies.dart';
import '../../domain/domainModel/sticky/sticky.dart';
import '../../domain/domainModel/sticky/value/sticky_color.dart';
import '../../domain/domainModel/sticky/value/sticky_font_size.dart';
import '../../domain/domainModel/sticky/value/sticky_id.dart';
import '../../domain/domainModel/sticky/value/sticky_last_edit.dart';
import '../../domain/domainModel/sticky/value/sticky_state.dart';
import '../../domain/domainModel/sticky/value/sticky_text.dart';
import '../../domain/domainService/search/search_repository.dart';

class SearchRepositoryMock implements SearchRepository {
  @override
  Future<Search> getOneById({required SearchId id}) async => Search(
      id: SearchId('ByIdTestId01'),
      condition: SearchCondition(RegExp(r'^毎日メモ(?!.*挨拶)(?=.*第d{1,3}回)敬具$')),
      result: SearchResult(Stickies(children: [
        Sticky(
            id: StickyId('ByIdTestStickyId01'),
            text: StickyText('ByIdTestStickyText01'),
            fontSize: StickyFontSize(16),
            lastEdit: StickyLastEdit(DateTime(2023, 1, 1, 0, 0, 0)),
            color: StickyColor(const Color(0xffff7f7f)),
            state: const StickyState(StickyStateType.editing)),
        Sticky(
            id: StickyId('ByIdTestStickyId02'),
            text: StickyText('ByIdTestStickyText02'),
            fontSize: StickyFontSize(18),
            lastEdit: StickyLastEdit(DateTime(2023, 1, 2, 5, 30, 10)),
            color: StickyColor(const Color(0xff7fbfff)),
            state: const StickyState(StickyStateType.archived))
      ])),
      state: const SearchState(SearchStateType.published),
      createdAt: SearchCreatedAt(DateTime(2023, 1, 7, 15, 24, 32)),
      publishedAt: SearchPublishedAt(DateTime(2023, 1, 7, 21, 43, 10)));

  @override
  Future<void> remove({required SearchId id}) async {}

  @override
  Future<void> saveNew({required Search newSearch}) async {}

  @override
  Future<void> update(
      {required SearchId id, required Search newSearch}) async {}
}
