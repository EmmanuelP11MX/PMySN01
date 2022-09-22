import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _preferences;

  static String _user = "";
  static String _password = "";

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String get user {
    return _preferences.getString('user') ?? _user;
  }

  static set user(String user) {
    _user = user;
    _preferences.setString('user', _user);
  }

  static String get password {
    return _preferences.getString('password') ?? _password;
  }

  static set password(String password) {
    _password = password;
    _preferences.setString('password', _password);
  }
}
