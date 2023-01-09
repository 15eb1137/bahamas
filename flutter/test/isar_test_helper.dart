import 'dart:ffi';
import 'dart:io';

import 'package:bahamas/infrastructure/sticky/sticky_isar_collection.dart';
import 'package:bahamas/infrastructure/sticky/sticky_repository_isar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import 'mock_path_provider_platform.dart';
import 'test_data.dart';

class IsarTestHelper {
  final _instanceHelper = _IsarInstanceTestHelper();
  StickyRepositoryIsar? _stickyRepository;

  Future<void> setUp() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await _instanceHelper.setUp();
    await _instanceHelper.setUpDB();
  }

  Future<void> tearDown() async {
    _stickyRepository?.dispose();
    _stickyRepository = null;
    await _instanceHelper.tearDown();
  }

  StickyRepositoryIsar getStickyRepository() {
    return _stickyRepository ??= StickyRepositoryIsar(
      instance: _instanceHelper.isar,
    );
  }
}

class _IsarInstanceTestHelper {
  Isar? _isar;
  Isar get isar => _isar!;

  Future<void> setUp() async {
    final evacuation = HttpOverrides.current;
    HttpOverrides.global = null;

    final isarLibraryDir = Directory(
      path.join(
        Directory.current.path,
        '.dart_tool',
        'test',
        'isar_core_library',
        Isar.version,
      ),
    );

    if (!isarLibraryDir.existsSync()) {
      await isarLibraryDir.create(recursive: true);
    }

    await Isar.initializeIsarCore(
      libraries: <Abi, String>{
        Abi.current(): path.join(
          isarLibraryDir.path,
          Abi.current().localName,
        ),
      },
      download: true,
    );

    HttpOverrides.global = evacuation;
    PathProviderPlatform.instance = MockPathProviderPlatform();

    final dir = await getApplicationSupportDirectory();
    if (!dir.existsSync()) {
      await dir.create(recursive: true);
    }
    _isar = await Isar.open(
      [StickyIsarCollectionSchema],
      directory: dir.path,
    );
  }

  Future<void> tearDown() async {
    if (_isar?.isOpen == true) {
      await _isar?.close(deleteFromDisk: true);
    }
    _isar = null;
    final dir = await getApplicationSupportDirectory();
    if (dir.existsSync()) {
      await dir.delete(recursive: true);
    }
  }

  Future<void> setUpDB() async {
    return isar.writeTxn(() async {
      await isar.stickies.putAll(
        stickiesDefaultTestData.children
            .map((sticky) => StickyIsarCollection()
              ..id = sticky.id.value
              ..text = sticky.text.value
              ..fontSize = sticky.fontSize.value
              ..lastEdit = sticky.lastEdit.value
              ..color = sticky.color.value.value
              ..state = sticky.state.value)
            .toList(),
      );
    });
  }
}

/// Copy from 'package:isar/src/native/isar_core.dart';
extension on Abi {
  String get localName {
    switch (Abi.current()) {
      case Abi.androidArm:
      case Abi.androidArm64:
      case Abi.androidIA32:
      case Abi.androidX64:
        return 'libisar.so';
      case Abi.macosArm64:
      case Abi.macosX64:
        return 'libisar.dylib';
      case Abi.linuxX64:
        return 'libisar.so';
      case Abi.windowsArm64:
      case Abi.windowsX64:
        return 'isar.dll';
      default:
        // ignore: only_throw_errors
        throw 'Unsupported processor architecture "${Abi.current()}".'
            'Please open an issue on GitHub to request it.';
    }
  }
}
