import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:result_dart/result_dart.dart';

import '../../data/models/anime_list.dart';
import '../../domain/repository/anime_repository.dart';
import '../provider/settings_provider.dart';
import '../widgets/anime_list_view.dart';

class AnimeFeedPage extends StatefulWidget {
  const AnimeFeedPage({super.key});

  @override
  State<AnimeFeedPage> createState() => _AnimeFeedPageState();
}

class _AnimeFeedPageState extends State<AnimeFeedPage> {
  late final Future<Result<AnimeList>> _getCurrentAnimeSession;

  @override
  void initState() {
    _getCurrentAnimeSession = context.read<AnimeRepository>().getCurrentAnimeSeason();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isLightTheme = context.watch<SettingsProvider>().getThemeMode() == ThemeMode.dark;

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
            onPressed: () => context.read<SettingsProvider>().toggleTheme(),
            icon: Icon(isLightTheme ? Icons.dark_mode : Icons.light_mode),
            tooltip: "Switch Theme",
          )
        ],
      ),
      body: FutureBuilder(
          future: _getCurrentAnimeSession,
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return snap.data!.fold(
                (data) => AnimeListView(data),
                // TODO: better error messages
                (error) => const Center(child: Text("error")),
              );
            }
          }),
    );
  }
}
