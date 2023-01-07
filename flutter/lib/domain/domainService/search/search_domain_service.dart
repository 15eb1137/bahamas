import '../../domainModel/search/value/search_id.dart';
import 'search_repository.dart';

class SearchDomainSearvice {
  final SearchRepository _repository;

  SearchDomainSearvice({required SearchRepository repository})
      : _repository = repository;

  @deprecated
  bool isExistId(SearchId id) {
    return false;
  }
}
