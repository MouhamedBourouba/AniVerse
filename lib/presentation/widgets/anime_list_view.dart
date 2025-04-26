import 'package:ani_verse/data/models/anime_info.dart';
import 'package:flutter/material.dart';

import 'anime_list_tile.dart';

class AnimeListView extends StatefulWidget {
  final List<AnimeInfo> _animeList;
  final void Function() onMaxScrollReach;

  const AnimeListView(
    this._animeList, {
    super.key,
    required this.onMaxScrollReach,
  });

  @override
  State<AnimeListView> createState() => _AnimeListViewState();
}

class _AnimeListViewState extends State<AnimeListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
      () {
        if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent) {
          widget.onMaxScrollReach.call();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 580,
        mainAxisExtent: 250,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: widget._animeList.length,
      itemBuilder: (context, index) => AnimeListTile(
        widget._animeList[index],
        key: ValueKey(widget._animeList[index].malId ?? 0),
      ),
    );
  }
}
