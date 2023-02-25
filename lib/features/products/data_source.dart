import 'package:shared_preferences/shared_preferences.dart';

abstract class DataSource {
  Future<void> save(String key, String value);
  Future<void> init();
  String? load(String key);
}

class SharedPreferencesDataSource implements DataSource {
  late SharedPreferences prefs;
  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  String? load(String key) {
    return prefs.getString(key);
  }

  @override
  Future<void> save(String key, String value) async {
    prefs.setString(key, value);
  }
}

class MockDataSource implements DataSource {
  @override
  Future<void> init() async {}

  @override
  String? load(String key) {
    return null;
  }

  @override
  Future<void> save(String key, String value) async {}
}
