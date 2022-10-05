import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _preferences;

  static String _user = "";
  static String _password = "";
  static bool _fullUser = false;
  static bool _showOnboradin = true;
  static String _theme = "";

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

  static bool get userFull {
    if (_preferences.getString('_fullUser') == 'yes') {
      return true;
    } else {
      return false;
    }
  }

  static set userFull(bool user) {
    _fullUser = user;
    if (_fullUser) {
      _preferences.setString('_fullUser', 'yes');
    } else {
      _preferences.setString('_fullUser', 'no');
    }
  }

  static set showOnboardin(bool show) {
    _showOnboradin = show;
    _preferences.setBool('showOnboarding', _showOnboradin);
  }

  static bool get showOnboardin {
    return _preferences.getBool('showOnboarding') ?? _showOnboradin;
  }

  static String get theme {
    return _preferences.getString('theme') ?? _theme;
  }

  static set theme(String theme) {
    _theme = theme;
    _preferences.setString('theme', _theme);
  }
}
