import 'package:ani_verse/data/models/anime_info.dart';
import 'package:flutter/material.dart';

class AnimeGridView extends StatefulWidget {
  final List<AnimeInfo> _animeList;
  final void Function() onMaxScrollReach;

  const AnimeGridView(this._animeList, {super.key, required this.onMaxScrollReach});

  @override
  State<AnimeGridView> createState() => _AnimeGridViewState();
}

class _AnimeGridViewState extends State<AnimeGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
      () {
        if (_scrollController.offset == _scrollController.position.maxScrollExtent) {
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
        maxCrossAxisExtent: 200,
        childAspectRatio: 0.6,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: widget._animeList.length,
      itemBuilder: (context, index) {
        String? imageUrl = widget._animeList[index].images?["webp"]?.imageUrl;
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(12)),
                  child: Image.network(
                    imageUrl ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget._animeList[index].title ?? "N/A",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // TODO: DO NOT DO THIS IN UI, API MAY CHANGE IN FUTURE
                    Text(
                      widget._animeList[index].status?.replaceFirst("Currently ", "") ?? "Airing",
                    ),
                    if (widget._animeList[index].score != null)
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                          size: 17,
                        ),
                      ),
                    if (widget._animeList[index].score != null)
                      Text(
                        widget._animeList[index].score.toString(),
                      )
                  ],
                ),
              ),
              const SizedBox(height: 8)
            ],
          ),
        );
      },
    );
  }
}
