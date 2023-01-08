import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/app.dart';
import '../../../application/sticky/sticky_app_service.dart';
import '../../../domain/domainModel/sticky/stickies.dart';
import '../../../domain/domainModel/sticky/value/sticky_state.dart';
import '../../../infrastructure/sticky/sticky_repository_isar.dart';

class StickiesNotifier extends StateNotifier<Stickies> {
  final StickyAppService _appService;
  StickiesNotifier({required StickyAppService appService})
      : _appService = appService,
        super(Stickies(children: []));
  Future<void> fetchAll() async => state = await _appService.getAll();
  Future<void> saveNew() async => await _appService.saveNew(
      text: 'testA',
      fontSize: 16,
      lastEdit: DateTime.now(),
      color: const Color(0xffff7f7f),
      state: StickyStateType.editing);
}

final stickiesNotifierProvider =
    StateNotifierProvider<StickiesNotifier, Stickies>((ref) => StickiesNotifier(
        appService: StickyAppService(
            repository: StickyRepositoryIsar(
                instance: ref.watch(
                    appModelProvider.select((model) => model.isarInstance!)))))
      ..fetchAll());
