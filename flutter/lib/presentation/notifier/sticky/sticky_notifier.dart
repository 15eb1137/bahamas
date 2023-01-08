import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/app.dart';
import '../../../application/sticky/sticky_app_service.dart';
import '../../../domain/domainModel/sticky/sticky.dart';
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
}

final stickyNotifierProvider = StateNotifierProvider<StickyNotifier, Sticky>(
    (ref) => StickyNotifier(
        appService: StickyAppService(
            repository: StickyRepositoryIsar(
                instance: ref.watch(appModelProvider
                    .select((model) => model.isarInstance!))))));
