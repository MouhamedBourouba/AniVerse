import 'package:ani_verse/data/models/anime_info.dart';
import 'package:ani_verse/data/models/anime_list.dart';
import 'package:ani_verse/data/repository/anime_repository.dart';
import 'package:ani_verse/data/repository/settings_repository.dart';
import 'package:ani_verse/domain/repository/anime_repository.dart';
import 'package:ani_verse/domain/repository/settings_repository.dart';
import 'package:ani_verse/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:result_dart/result_dart.dart';

import 'app_colors.dart';

class AniVerse extends StatelessWidget {
  const AniVerse({super.key});

  @override
  Widget build(BuildContext context) {
    const ColorScheme colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      error: AppColors.error,
      onError: AppColors.onError,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider(SettingsRepositoryMockImpl())),
        Provider<AnimeRepository>(create: (context) => AnimeRepositoryImpl())
      ],
      child: MaterialApp(
          title: 'AniVerse',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: colorScheme,
            appBarTheme: AppBarTheme(
                backgroundColor: colorScheme.primary,
                iconTheme: IconThemeData(
                  color: colorScheme.onPrimary,
                ),
                titleTextStyle: TextStyle(color: colorScheme.onPrimary, fontSize: 16)),
            useMaterial3: true,
          ),
          home: const AnimeFeedScreen()),
    );
  }
}

class AnimeFeedScreen extends StatefulWidget {
  const AnimeFeedScreen({super.key});

  @override
  State<AnimeFeedScreen> createState() => _AnimeFeedScreenState();
}

class _AnimeFeedScreenState extends State<AnimeFeedScreen> {
  late final Future<Result<AnimeList>> _getCurrentAnimeSession;

  @override
  void initState() {
    _getCurrentAnimeSession = context.read<AnimeRepository>().getCurrentAnimeSeason();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isRow = context.watch<SettingsProvider>().getAnimeFeedStyle() == AnimeFeedStyle.row;

    return Scaffold(
      drawer: const Drawer(
        child: Placeholder(),
      ),
      appBar: AppBar(
        title: const Text("Anime Feed"),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => const SearchScreen())),
            icon: const Icon(Icons.search),
            tooltip: "Open Search Screen",
          ),
          IconButton(
            onPressed: () => context.read<SettingsProvider>().toggleAnimeFeedStyle(),
            icon: Icon(isRow ? Icons.table_rows_rounded : Icons.grid_view_rounded),
            tooltip: "Switch Anime Display Style",
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
                  (data) => isRow ? AnimeListView(data) : AnimeGridView(data),
                  // TODO: better error messages
                  (error) => Center(child: Text(error.getErrorMessage())));
            }
          }),
    );
  }
}

class AnimeFeedRow extends StatelessWidget {
  final AnimeList animeList;

  const AnimeFeedRow({super.key, required this.animeList});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Rowwwww"));
  }
}

class AnimeListView extends StatelessWidget {
  final AnimeList _animeList;
  const AnimeListView(this._animeList, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _animeList.data?.length ?? 0,
      itemBuilder: (context, index) => SizedBox(height: 200, child: AnimeListTile(_animeList.data![index])),
    );
  }
}

class AnimeGridView extends StatelessWidget {
  final AnimeList _animeList;

  const AnimeGridView(this._animeList, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250, childAspectRatio: 0.5),
      itemCount: _animeList.data?.length ?? 0,
      itemBuilder: (BuildContext context, int index) => AnimeCard(_animeList.data![index]),
    );
  }
}

class AnimeListTile extends StatelessWidget {
  final AnimeInfo animeInfo;
  const AnimeListTile(this.animeInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class AnimeCard extends StatelessWidget {
  final AnimeInfo animeInfo;

  const AnimeCard(this.animeInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
