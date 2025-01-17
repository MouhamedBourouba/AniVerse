import 'package:ani_verse/data/models/anime_info.dart';
import 'package:ani_verse/presentation/provider/color_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimeListTile extends StatelessWidget {
  final AnimeInfo animeInfo;

  const AnimeListTile(this.animeInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    String? imageUrl = animeInfo.images?["webp"]?.largeImageUrl;
    Color thisColor = context.read<ColorProvider>().getRandomColor(key!);

    return Card(
      child: Row(
        children: [
          imageUrl != null
              ? Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        Image.network(
                          imageUrl,
                          height: double.infinity,
                          width: double.infinity,
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
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        animeInfo.synopsis ?? "No Synopsis Available",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Rating: ${animeInfo.score ?? "N/A"}",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                      ),
                      Text(
                        "${animeInfo.type ?? "N/A"} * ${animeInfo.duration?.replaceAll(" per ep", "") ?? "N/A"}",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                      ),
                      Text(
                        "Status: ${animeInfo.status ?? ""}",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                      ),
                      Text(
                        "Source: ${animeInfo.source ?? "N/A"}",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                      ),
                    ],
                  ),
                ),
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
          ),
          const SizedBox(width: 4)
        ],
      ),
    );
  }
}
