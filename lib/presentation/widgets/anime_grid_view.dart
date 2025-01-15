import 'package:ani_verse/data/models/anime_list.dart';
import 'package:flutter/material.dart';

import 'anime_card.dart';

class AnimeGridView extends StatelessWidget {
  final AnimeList _animeList;

  const AnimeGridView(this._animeList, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250, childAspectRatio: 0.6),
      itemCount: _animeList.data?.length ?? 0,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: AnimeCard(_animeList.data![index]),
      ),
    );
  }
}
