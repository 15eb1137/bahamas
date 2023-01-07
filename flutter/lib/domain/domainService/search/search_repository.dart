// abstract? interface
import '../../domainModel/search/search.dart';
import '../../domainModel/search/value/search_id.dart';

class SearchRepository {
  SearchRepository();

  Future<void> saveNew({required Search newSearch}) async => throw Exception();
  Future<void> update(
          {required SearchId id, required Search newSearch}) async =>
      throw Exception();
  Future<void> remove({required SearchId id}) async => throw Exception();
  Future<Search> getOneById({required SearchId id}) async => throw Exception();
}
