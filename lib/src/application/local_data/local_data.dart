import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  static Future<void> clearAll() async {
    print("Clear all  data from local storage");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
