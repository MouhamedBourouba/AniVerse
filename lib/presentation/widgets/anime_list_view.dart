import 'package:ani_verse/data/models/anime_list.dart';
import 'package:flutter/material.dart';

import 'anime_list_tile.dart';

class AnimeListView extends StatelessWidget {
  final AnimeList _animeList;

  const AnimeListView(this._animeList, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _animeList.data?.length ?? 0,
      itemBuilder: (context, index) => SizedBox(
          height: 260,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16),
            child: AnimeListTile(_animeList.data![index]),
          )),
    );
  }
}
