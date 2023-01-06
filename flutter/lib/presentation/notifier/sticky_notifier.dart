import 'package:bahamas/application/sticky_app_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domainModel/sticky.dart';

class StickyNotifier extends StateNotifier<Sticky> {
  final StickyAppService _appService;

  StickyNotifier({required StickyAppService appService})
      : _appService = appService,
        super(Sticky.initial());

  Future<void> getOneById(String id) async {
    final result = await _appService.getOneById(id);
    state = result;
  }
}
