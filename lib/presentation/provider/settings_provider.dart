import 'package:ani_verse/app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/enums.dart';

class SettingsProvider extends ChangeNotifier {
  final SharedPreferences _sp;
  ThemeMode? _tm;
  AnimeFeedStyle? _animeFeedStyle;

  SettingsProvider(this._sp);

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

    _sp.setInt(AppConstants.animeFeedStyleKey, _animeFeedToInt(newStyle));
    _animeFeedStyle = newStyle;

    notifyListeners();
  }

  ThemeMode getThemeMode() {
    if (_tm == null) {
      final themeMode = _intToThemeMode(_sp.getInt(AppConstants.themeKey) ?? 0);
      _tm = themeMode;
    }
    return _tm!;
  }

  void setThemeMode(ThemeMode tm) {
    _sp.setInt("theme_mode", _themeModeToInt(tm));
    _tm = tm;
    notifyListeners();
  }
}

AnimeFeedStyle _intToAnimeFeed(int v) {
  switch (v) {
    case 0:
      return AnimeFeedStyle.grid;
    case 1:
      return AnimeFeedStyle.row;
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
