import 'package:flutter/material.dart';

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

    return MaterialApp(
      title: 'AniVerse',
      theme: ThemeData(
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          iconTheme: IconThemeData(
            color: colorScheme.onPrimary,
          ),
          titleTextStyle: TextStyle(
            color: colorScheme.onPrimary,
            fontSize: 16
          )
        ),
        useMaterial3: true,
      ),
      home: const AnimeFeedScree()
    );
  }
}

class AnimeFeedScree extends StatelessWidget {
  const AnimeFeedScree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimeFeed"),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      ),
    );
  }
}