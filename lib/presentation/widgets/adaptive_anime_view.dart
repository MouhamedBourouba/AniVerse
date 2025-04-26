import 'package:ani_verse/presentation/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/enums.dart';
import '../../data/models/anime_info.dart';
import 'anime_grid.dart';
import 'anime_list_view.dart';

class AdaptiveAnimeView extends StatelessWidget {
  final List<AnimeInfo> _animeList;
  final void Function() onMaxScrollReach;

  const AdaptiveAnimeView(
    this._animeList, {
    super.key,
    required this.onMaxScrollReach,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, value, child) =>
          value.getAnimeFeedStyle() == AnimeFeedStyle.row
              ? AnimeListView(
                  _animeList,
                  onMaxScrollReach: onMaxScrollReach,
                )
              : AnimeGridView(
                  _animeList,
                  onMaxScrollReach: onMaxScrollReach,
                ),
    );
  }
}
