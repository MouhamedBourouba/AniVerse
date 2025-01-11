import 'package:flutter/cupertino.dart';

enum AnimeFeedStyle {
  row,
  grid;
}

abstract class SettingsRepository {
  AnimeFeedStyle getAnimeFeedStyle();
  void setAnimeFeedStyle(AnimeFeedStyle style);
}

class SettingsProvider extends ChangeNotifier {
  final SettingsRepository _sr;
  SettingsProvider(this._sr);

  AnimeFeedStyle getAnimeFeedStyle() => _sr.getAnimeFeedStyle();

  void toggleAnimeFeedStyle() {
    final newStyle = _sr.getAnimeFeedStyle() == AnimeFeedStyle.row
        ? AnimeFeedStyle.grid
        : AnimeFeedStyle.row;
    _sr.setAnimeFeedStyle(newStyle);
    notifyListeners();
  }

}