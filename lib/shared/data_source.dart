import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDataSource {
  late SharedPreferences prefs;
  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  String? load(String key) {
    return prefs.getString(key);
  }

  Future<void> save(String key, String value) async {
    prefs.setString(key, value);
  }
}
