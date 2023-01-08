import 'package:bahamas/application/sticky/sticky_app_service.dart';
import 'package:bahamas/domain/domainModel/sticky/stickies.dart';
import 'package:bahamas/infrastructure/sticky/sticky_repository_mock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StickiesNotifier extends StateNotifier<Stickies> {
  final StickyAppService _appService;
  StickiesNotifier({required StickyAppService appService})
      : _appService = appService,
        super(Stickies(children: []));
  Future<void> fetchAll() async => state = await _appService.getAll();
}

final stickiesNotifierProvider =
    StateNotifierProvider<StickiesNotifier, Stickies>((ref) => StickiesNotifier(
        appService: StickyAppService(repository: StickyRepositoryMock()))
      ..fetchAll());
