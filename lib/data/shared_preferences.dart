import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  final String _kSaveUser = 'SaveUser';

  Future<bool> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kSaveUser) ?? false;
  }

  Future<bool> setUser(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_kSaveUser, value);
  }
}
