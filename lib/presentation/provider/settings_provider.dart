import 'package:ani_verse/app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  final SharedPreferences _sp;
  ThemeMode? _tm;

  SettingsProvider(this._sp);

  void toggleTheme() {
    _setThemeMode(_tm! == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
    notifyListeners();
  }

  ThemeMode getThemeMode() {
    if (_tm == null) {
      final themeMode = _intToThemeMode(_sp.getInt(AppConstants.themeKey) ?? 0);
      _tm = themeMode;
    }
    return _tm!;
  }

  void _setThemeMode(ThemeMode tm) {
    _sp.setInt("theme_mode", _themeModeToInt(tm));
    _tm = tm;
    notifyListeners();
  }
}

ThemeMode _intToThemeMode(int v) {
  switch (v) {
    case 0:
      return ThemeMode.system;
    case 1:
      return ThemeMode.light;
    case 2:
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
}

int _themeModeToInt(ThemeMode tm) {
  switch (tm) {
    case ThemeMode.system:
      return 0;
    case ThemeMode.light:
      return 1;
    case ThemeMode.dark:
      return 2;
  }
}
