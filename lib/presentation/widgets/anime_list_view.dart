import 'package:ani_verse/data/models/anime_list.dart';
import 'package:flutter/material.dart';

import 'anime_list_tile.dart';

class AnimeListView extends StatelessWidget {
  final AnimeList _animeList;

  const AnimeListView(this._animeList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1500),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 600,
              mainAxisExtent: 250,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: _animeList.data?.length ?? 0,
            itemBuilder: (context, index) => AnimeListTile(
              _animeList.data![index],
              key: ValueKey(_animeList.data![index].malId ?? 0),
            ),
          ),
        ),
      ),
    );
  }
}
