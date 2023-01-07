import '../../../common/logger.dart';
import '../sticky/stickies.dart';
import 'value/search_condition.dart';
import 'value/search_created_at.dart';
import 'value/search_id.dart';
import 'value/search_published_at.dart';
import 'value/search_result.dart';
import 'value/search_state.dart';

class Search {
  final SearchId id;
  SearchCondition _condition;
  SearchResult _result;
  SearchState _state;
  final SearchCreatedAt _createdAt;
  SearchPublishedAt _publishedAt;

  Search(
      {required this.id,
      required SearchCondition condition,
      required SearchResult result,
      required SearchState state,
      required SearchCreatedAt createdAt,
      required SearchPublishedAt publishedAt})
      : _condition = condition,
        _result = result,
        _state = state,
        _createdAt = SearchCreatedAt(DateTime.now()),
        _publishedAt = publishedAt;

  factory Search.initial() => Search(
      id: SearchId('test'),
      condition: SearchCondition(RegExp('test')),
      result: SearchResult(Stickies(children: [])),
      state: const SearchState(SearchStateType.editing),
      createdAt: SearchCreatedAt(DateTime.now()),
      publishedAt: SearchPublishedAt(null));

  SearchCondition get condition => _condition;
  SearchResult get result => _result;
  SearchState get state => _state;
  SearchCreatedAt get createdAt => _createdAt;
  SearchPublishedAt get publishedAt => _publishedAt;

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is Search && other.id == id);

  @override
  int get hashCode => runtimeType.hashCode ^ id.hashCode;

  void changeCondition(SearchCondition newCondition) =>
      _condition = newCondition;
  void changeResult(SearchResult newResult) => _result = newResult;
  void changeState(SearchState newState) {
    if (_state.value == SearchStateType.editing) {
      if (newState.value == SearchStateType.fetching ||
          newState.value == SearchStateType.discarded) {
        _state = newState;
      } else {
        logger.e('State editing can change to fetching or discarded only.');
        throw Exception();
      }
    } else if (_state.value == SearchStateType.fetching) {
      if (newState.value == SearchStateType.published) {
        _state = newState;
        _publishedAt = SearchPublishedAt(DateTime.now());
      } else if (newState.value == SearchStateType.failed) {
        _state = newState;
      } else {
        logger.e('State fetching can change to published or failed only.');
        throw Exception();
      }
    } else {
      logger.e('State discarded, failed or published can not change state.');
      throw Exception();
    }
  }
}
