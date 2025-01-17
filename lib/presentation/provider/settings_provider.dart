import 'package:ani_verse/app/app_constants.dart';
import 'package:ani_verse/app/enums.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  final SharedPreferences _sp;
  ThemeMode? _tm;
  AnimeFeedStyle? _animeFeedStyle;

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

  AnimeFeedStyle getAnimeFeedStyle() {
    if (_animeFeedStyle == null) {
      final animeFeed = _intToAnimeFeed(_sp.getInt(AppConstants.animeFeedStyleKey) ?? 0);
      _animeFeedStyle = animeFeed;
    }
    return _animeFeedStyle!;
  }

  void toggleAnimeFeedStyle() {
    final newStyle =
        getAnimeFeedStyle() == AnimeFeedStyle.row ? AnimeFeedStyle.grid : AnimeFeedStyle.row;
    _setAnimeFeedStyle(newStyle);
  }

  void _setAnimeFeedStyle(AnimeFeedStyle as) {
    _sp.setInt(AppConstants.animeFeedStyleKey, _animeFeedToInt(as));
    _animeFeedStyle = as;
    notifyListeners();
  }
  void _setThemeMode(ThemeMode tm) {
    _sp.setInt(AppConstants.themeKey, _themeModeToInt(tm));
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

AnimeFeedStyle _intToAnimeFeed(int v) {
  switch (v) {
    case 0:
      return AnimeFeedStyle.row;
    case 1:
      return AnimeFeedStyle.grid;
    default:
      return AnimeFeedStyle.grid;
  }
}

int _animeFeedToInt(AnimeFeedStyle tm) {
  switch (tm) {
    case AnimeFeedStyle.row:
      return 0;
    case AnimeFeedStyle.grid:
      return 1;
  }
}