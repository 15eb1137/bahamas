import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/search/search_app_service.dart';
import '../../../application/sticky/sticky_app_service.dart';
import '../../../domain/domainModel/search/search.dart';
import '../../../domain/domainModel/search/value/search_condition.dart';
import '../../../domain/domainModel/search/value/search_result.dart';
import '../../../domain/domainModel/sticky/stickies.dart';
import '../../../infrastructure/search/search_repository_mock.dart';
import '../../../infrastructure/sticky/sticky_repository_mock.dart';

class SearchNotifier extends StateNotifier<Search> {
  final SearchAppService _appService;
  final StickyAppService _stickyAppService;
  SearchNotifier(
      {required SearchAppService appService,
      required StickyAppService stickyAppService})
      : _appService = appService,
        _stickyAppService = stickyAppService,
        super(Search.initial());

  Future<Stickies> search() async {
    final stickies = await _stickyAppService.getAll();
    await _appService.searchStickiesByConditions(state, stickies);
    final updatedSearch = await _appService.getOneById(state.id);
    changeResult(updatedSearch.result.value);
    return state.result.value;
  }

  void changeCondition(String expressions) => state = Search(
      id: state.id,
      condition: SearchCondition(RegExp(expressions)),
      result: state.result,
      state: state.state,
      createdAt: state.createdAt,
      publishedAt: state.publishedAt);

  void changeResult(Stickies stickies) => state = Search(
      id: state.id,
      condition: state.condition,
      result: SearchResult(stickies),
      state: state.state,
      createdAt: state.createdAt,
      publishedAt: state.publishedAt);
}

final searchNotifierProvider = StateNotifierProvider<SearchNotifier, Search>(
    (ref) => SearchNotifier(
        appService: SearchAppService(repository: SearchRepositoryMock()),
        stickyAppService:
            StickyAppService(repository: StickyRepositoryMock())));
