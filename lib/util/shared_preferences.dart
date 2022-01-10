import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  getValue(String key) async {
    final value = await _prefs.then((prefs) async => prefs.get(key));
    return value;
  }

  setString(String key, String value) async {
    await _prefs.then((prefs) async => await prefs.setString(key, value));
  }

  setBool(String key, bool value) async {
    await _prefs.then((prefs) async => await prefs.setBool(key, value));
  }

  setDouble(String key, double value) async {
    await _prefs.then((prefs) async => await prefs.setDouble(key, value));
  }

  setInt(String key, int value) async {
    await _prefs.then((prefs) async => await prefs.setInt(key, value));
  }
}
