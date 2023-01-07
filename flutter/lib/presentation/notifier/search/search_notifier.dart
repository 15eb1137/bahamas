import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/search/search_app_service.dart';
import '../../../application/sticky/sticky_app_service.dart';
import '../../../domain/domainModel/search/search.dart';
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

  Future<void> search() async {
    final stickies = await _stickyAppService.getAll();
    _appService.searchStickiesByConditions(state, stickies);
  }
}

final searchNotifierProvider = StateNotifierProvider<SearchNotifier, Search>(
    (ref) => SearchNotifier(
        appService: SearchAppService(repository: SearchRepositoryMock()),
        stickyAppService:
            StickyAppService(repository: StickyRepositoryMock())));
