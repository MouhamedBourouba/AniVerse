import 'package:ani_verse/domain/repository/settings_repository.dart';

class SettingsRepositoryMockImpl implements SettingsRepository {
  AnimeFeedStyle _style = AnimeFeedStyle.row;
  @override
  AnimeFeedStyle getAnimeFeedStyle() {
    return _style;
  }

  @override
  void setAnimeFeedStyle(AnimeFeedStyle style) {
    _style = style;
  }
}