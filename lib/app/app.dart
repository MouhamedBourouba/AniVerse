import 'package:ani_verse/data/models/anime_list.dart';
import 'package:ani_verse/data/repository/AnimeRepository.dart';
import 'package:ani_verse/data/repository/SettingsRepository.dart';
import 'package:ani_verse/domain/repository/anime_repository.dart';
import 'package:ani_verse/domain/repository/settings_repository.dart';
import 'package:ani_verse/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class AnimeFeedScreen extends StatelessWidget {
  const AnimeFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isRow = context.watch<SettingsProvider>().getAnimeFeedStyle() == AnimeFeedStyle.row;
    final anime_repository = context.read<AnimeRepository>();

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
          future: anime_repository.getCurrentAnimeSeason(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const DelayedWidget(
                  delay: Duration(milliseconds: 500),
                  child: Center(child: CircularProgressIndicator()));
            } else {
              return snap.data!.fold(
                  (data) => isRow ? AnimeFeedRow(animeList: data) : AnimeFeedGrid(animeList: data),
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
    return Center(child: Text("Rowwwww"));
  }
}

class AnimeFeedGrid extends StatelessWidget {
  final AnimeList animeList;

  const AnimeFeedGrid({super.key, required this.animeList});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("GRIDDDD"));
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

class DelayedWidget extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const DelayedWidget({super.key, required this.child, required this.delay});

  @override
  State<DelayedWidget> createState() => _DelayedWidgetState();
}

class _DelayedWidgetState extends State<DelayedWidget> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        widget.delay,
        () => setState(() {
              _isVisible = true;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return _isVisible ? widget.child : const SizedBox.shrink();
  }
}
