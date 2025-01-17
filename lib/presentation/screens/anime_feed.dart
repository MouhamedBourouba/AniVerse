import 'package:ani_verse/app/enums.dart';
import 'package:ani_verse/presentation/provider/anime_provider.dart';
import 'package:ani_verse/presentation/widgets/adaptive_anime_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../provider/settings_provider.dart';

class AnimeFeedPage extends StatefulWidget {
  const AnimeFeedPage({super.key});

  @override
  State<AnimeFeedPage> createState() => _AnimeFeedPageState();
}

class _AnimeFeedPageState extends State<AnimeFeedPage> {
  @override
  void initState() {
    super.initState();
    context.read<AnimeProvider>().fetchCurrentAnimeData();
  }

  @override
  Widget build(BuildContext context) {
    final isLightTheme = context.watch<SettingsProvider>().getThemeMode() == ThemeMode.dark;
    final isRow = context.watch<SettingsProvider>().getAnimeFeedStyle() == AnimeFeedStyle.row;

    return Scaffold(
      drawer: const Drawer(
        child: Placeholder(),
      ),
      appBar: AppBar(
        title: const Text("Anime Feed"),
        actions: [
          IconButton(
            onPressed: () => context.go("/search"),
            icon: const Icon(Icons.search),
            tooltip: "Open Search Screen",
          ),
          IconButton(
            onPressed: () => context.read<SettingsProvider>().toggleAnimeFeedStyle(),
            icon: Icon(isRow ? Icons.table_rows_outlined : Icons.grid_view),
            tooltip: "Switch Anime Display",
          ),
          IconButton(
            onPressed: () => context.read<SettingsProvider>().toggleTheme(),
            icon: Icon(isLightTheme ? Icons.dark_mode : Icons.light_mode),
            tooltip: "Switch Theme",
          )
        ],
      ),
      body: Consumer<AnimeProvider>(
        builder: (BuildContext context, AnimeProvider provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.isError) {
            return Center(child: Text(provider.errorMessage ?? ""));
          } else {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1700),
                  child: AdaptiveAnimeView(
                    provider.animeData ?? [],
                    onMaxScrollReach: provider.fetchMoreAnime,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
