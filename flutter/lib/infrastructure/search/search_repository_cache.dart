import '../../domain/domainModel/search/search.dart';
import '../../domain/domainModel/search/value/search_id.dart';
import '../../domain/domainService/search/search_repository.dart';

class SearchRepositoryCache implements SearchRepository {
  static final SearchRepositoryCache _instance =
      SearchRepositoryCache._internal();
  SearchRepositoryCache._internal();
  factory SearchRepositoryCache() => _instance;

  late Search search;

  @override
  Future<Search> getOneById({required SearchId id}) async {
    return search.id == id ? search : Search.initial();
  }

  @override
  Future<void> remove({required SearchId id}) {
    throw UnimplementedError();
  }

  @override
  Future<void> saveNew({required Search newSearch}) async {
    search = newSearch;
  }

  @override
  Future<void> update({required SearchId id, required Search newSearch}) async {
    search = newSearch;
  }
}
