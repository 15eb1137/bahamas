import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/app.dart';
import '../../../application/sticky/sticky_app_service.dart';
import '../../../domain/domainModel/sticky/sticky.dart';
import '../../../domain/domainModel/sticky/value/sticky_id.dart';
import '../../../domain/domainModel/sticky/value/sticky_text.dart';
import '../../../infrastructure/sticky/sticky_repository_isar.dart';

class StickyNotifier extends StateNotifier<Sticky> {
  final StickyAppService _appService;

  StickyNotifier({required StickyAppService appService})
      : _appService = appService,
        super(Sticky.initial());

  Future<void> getOneById(String id) async {
    final result = await _appService.getOneById(stickyId: id);
    state = result;
  }

  Future<void> saveNew() async {
    final publishedId = await _appService.saveNew(
        text: state.text.value,
        fontSize: state.fontSize.value,
        lastEdit: state.lastEdit.value,
        color: state.color.value,
        state: state.state.value);
    return changeId(publishedId.value);
  }

  Future<void> update() async {
    await _appService.update(
        stickyId: state.id.value,
        text: state.text.value,
        fontSize: state.fontSize.value,
        lastEdit: state.lastEdit.value,
        color: state.color.value,
        state: state.state.value);
  }

  void changeAll(Sticky sticky) => state = sticky;

  void changeId(String id) => state = Sticky(
      id: StickyId(id),
      text: state.text,
      fontSize: state.fontSize,
      lastEdit: state.lastEdit,
      color: state.color,
      state: state.state);

  void changeText(String text) => state = Sticky(
      id: state.id,
      text: StickyText(text),
      fontSize: state.fontSize,
      lastEdit: state.lastEdit,
      color: state.color,
      state: state.state);
}

final stickyNotifierProvider = StateNotifierProvider<StickyNotifier, Sticky>(
    (ref) => StickyNotifier(
        appService: StickyAppService(
            repository: StickyRepositoryIsar(
                instance: ref.watch(appModelProvider
                    .select((model) => model.isarInstance!))))));
