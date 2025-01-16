import 'package:ani_verse/data/models/anime_info.dart';
import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  final AnimeInfo _animeInfo;

  const AnimeCard(this._animeInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_animeInfo.title ?? ""),
    );
  }
}
