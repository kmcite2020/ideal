import 'package:hive_flutter/hive_flutter.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HiveStorage implements IPersistStore {
  late Box box;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox('quwstion');
  }

  @override
  Object? read(String key) {
    return box.get(key);
  }

  @override
  Future<void> write<T>(String key, T value) async {
    return box.put(key, value);
  }

  @override
  Future<void> delete(String key) async {
    return box.delete(key);
  }

  @override
  Future<void> deleteAll() async {
    await box.clear();
  }
}
