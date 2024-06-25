import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_service.g.dart';

enum BoxName {
  videoData;

  String get keyDataLocal {
    switch (this) {
      case videoData:
        return 'KEY_REGISTER_FILES_VIDEO';
    }
  }
}

@Riverpod(keepAlive: true)
HiveService hiveService(HiveServiceRef ref) {
  return HiveService(ref);
}

class HiveService {
  final Ref ref;
  Box? _box;

  HiveService(this.ref);

  Box? get box => _box;

  init() {
    Hive.initFlutter();
  }

  Future<void> openBox() async {
    _box = await Hive.openBox(BoxName.videoData.keyDataLocal);
  }

  dynamic getData(String key) {
    return _box?.get(key);
  }

  dynamic putData(String key, String value) {
    return _box?.put(key, value);
  }

  Future<void> deleteData(String key) async {
    _box?.delete(key);
  }

  Future<void> closeBox() async {
    if (!_box!.isOpen) {
      await _box?.close();
    }
  }

  Future<void> clearBox() async {
    await _box?.clear();
    // ref.read(videoProvider.notifier).state = const AsyncValue.data(null);
    // ref.watch(videoControllerProvider.notifier).state =
    //     const AsyncValue.data(null);
  }
}
