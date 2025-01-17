import 'package:ani_verse/data/models/anime_info.dart';
import 'package:flutter/material.dart';

import 'anime_list_tile.dart';

class AnimeListView extends StatelessWidget {
  final List<AnimeInfo> _animeList;

  const AnimeListView(this._animeList, {super.key});

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 580,
        mainAxisExtent: 250,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: _animeList.length,
      itemBuilder: (context, index) => AnimeListTile(
        _animeList[index],
        key: ValueKey(_animeList[index].malId ?? 0),
      ),
    );
  }
}
