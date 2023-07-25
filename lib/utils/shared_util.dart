import 'package:shared_preferences/shared_preferences.dart';

import 'package:daily_todos/config/keys.dart';
export 'package:daily_todos/config/keys.dart';

class SharedUtil {
  static SharedUtil? _instance;

  SharedUtil._internal();

  factory SharedUtil() => _getInstance();

  static SharedUtil _getInstance() {
    _instance ??= SharedUtil._internal();
    return _instance!;
  }

  static SharedUtil get instance => _getInstance();

  Future<void> saveString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (key == Keys.account) {
      await prefs.setString(key, value);
      return;
    }
    String account = prefs.getString(Keys.account) ?? 'default';
    await prefs.setString(key + account, value);
  }

  //---------------------- get ----------------------------------
  Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (key == Keys.account) {
      return prefs.getString(key);
    }
    String account = prefs.getString(Keys.account) ?? 'default';
    return prefs.getString(key + account);
  }

  Future<int?> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String account = prefs.getString(Keys.account) ?? 'default';
    return prefs.getInt(key + account);
  }

  Future<double?> getDouble(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String account = prefs.getString(Keys.account) ?? 'default';
    return prefs.getDouble(key + account);
  }

  Future<bool?> getBoolean(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String account = prefs.getString(Keys.account) ?? 'default';
    return prefs.getBool(key + account);
  }

  Future<List<String>?> getStringList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String account = prefs.getString(Keys.account) ?? 'default';
    return prefs.getStringList(key + account);
  }

  Future<List<String>?> getReadList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String account = prefs.getString(Keys.account) ?? 'default';
    List<String> strings = prefs.getStringList(key + account) ?? [];
    return strings;
  }
}
