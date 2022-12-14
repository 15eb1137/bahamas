import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'sticky/sticky_isar_collection.dart';
import 'sticky/sticky_repository_isar.dart';

final isarProvider = FutureProvider((ref) async => await IsarHelper().setUp());

class IsarHelper {
  StickyRepositoryIsar? _stickyRepository;

  Future<Isar> setUp() async {
    WidgetsFlutterBinding.ensureInitialized();
    String path = '';
    if (!kIsWeb) {
      final dir = await getApplicationSupportDirectory();
      path = dir.path;
    }
    return await Isar.open(
      [StickyIsarCollectionSchema],
      directory: path,
    );
  }

  Future<void> tearDown() async {
    _stickyRepository?.dispose();
    _stickyRepository = null;
    //     if (_isar?.isOpen == true) {
    //   await _isar?.close(deleteFromDisk: true);
    // }
    // _isar = null;
  }

  // StickyRepositoryIsar getStickyRepository() {
  //   return _stickyRepository ??= StickyRepositoryIsar(
  //     instance: _instanceHelper.isar,
  //   );
  // }
}
