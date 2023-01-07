import '../../domain/domainModel/search/search.dart';
import '../../domain/domainModel/search/value/search_result.dart';
import '../../domain/domainModel/sticky/stickies.dart';
import '../../domain/domainService/search/search_repository.dart';

class SearchAppService {
  final SearchRepository _repository;
  SearchAppService({required SearchRepository repository})
      : _repository = repository;

  void searchStickiesByConditions(Search search, Stickies stickies) {
    final matched = stickies.children
        .where((sticky) => sticky.text.contains(search.condition))
        .toList();
    search.changeResult(SearchResult(Stickies(children: matched)));
    _repository.update(id: search.id, newSearch: search);
  }
}
