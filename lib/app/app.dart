import 'package:ani_verse/data/repository/SettingsRepository.dart';
import 'package:ani_verse/domain/repository/settings_repository.dart';
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
      providers: [ChangeNotifierProvider(create: (_) => SettingsProvider(SettingsRepositoryMockImpl()))],
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
    return Scaffold(
      drawer: const Drawer(
        child: Placeholder(),
      ),
      appBar: AppBar(
        title: const Text("AnimeFeed"),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen())),
            icon: const Icon(Icons.search),
            tooltip: "Open Search Screen",
          ),
          IconButton(
            onPressed: () => context.read<SettingsProvider>().toggleAnimeFeedStyle(),
            icon: Builder(builder: (context) {
              final isRow = context.watch<SettingsProvider>().getAnimeFeedStyle();
              return Icon(isRow == AnimeFeedStyle.row ? Icons.table_rows_rounded : Icons.grid_view_rounded);
            }),
            tooltip: "Switch Anime Display Style",
          )
        ],
      ),
    );
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
