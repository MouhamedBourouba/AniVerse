import 'dart:math';

import 'package:ani_verse/data/models/anime_info.dart';
import 'package:flutter/material.dart';

class AnimeListTile extends StatelessWidget {
  final AnimeInfo animeInfo;

  const AnimeListTile(this.animeInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    String? imageUrl = animeInfo.images?["webp"]?.largeImageUrl;
    Color thisColor = Colors.accents[Random().nextInt(Colors.accents.length)].shade700;

    return Card(
      elevation: 6,
      child: Row(
        children: [
          imageUrl != null
              ? SizedBox(
                  width: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        Image.network(
                          width: 190,
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.black.withAlpha(170),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    animeInfo.title ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: Colors.white),
                                    maxLines: 3,
                                  ),
                                  Text(
                                    animeInfo.studios?.first.name ?? "",
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: thisColor,
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  color: Colors.grey,
                  child: const Center(
                    child: Text("N/A"),
                  ),
                ),
          const Padding(padding: EdgeInsets.only(left: 8)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  animeInfo.synopsis ?? "No Synopsis Available",
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  "Status: ${animeInfo.status ?? ""}",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.blueGrey),
                ),
                Text(
                  "Type: ${animeInfo.type ?? "N/A"}",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.blueGrey),
                ),
                Text(
                  "Source: ${animeInfo.source ?? "N/A"}",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.blueGrey),
                ),
                Text(
                  "Rating ${animeInfo.score ?? "N/A"}",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.blueGrey),
                ),
                const Spacer(),
                SizedBox(
                  height: 25,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: thisColor.withAlpha(350),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            animeInfo.genres![index].name ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    itemCount: animeInfo.genres?.length ?? 0,
                  ),
                ),
                const SizedBox(height: 8)
              ],
            ),
          )
        ],
      ),
    );
  }
}
