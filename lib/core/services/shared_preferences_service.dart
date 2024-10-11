import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences prefs;

  SharedPreferencesService({required this.prefs});

  Future<void> saveData(String key, String value) async {
    await prefs.setString(key, value);
  }

  Future<String?> getData(String key) async {
    return prefs.getString(key);
  }
}
