import 'package:ani_verse/app/app_constants.dart';
import 'package:ani_verse/app/app_provider.dart';
import 'package:ani_verse/app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../presentation/provider/settings_provider.dart';

class AniVerse extends StatelessWidget {
  const AniVerse({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(),
        child: Consumer<SettingsProvider>(
          builder: (BuildContext context, SettingsProvider provider, _) => MaterialApp.router(
            title: "AniVerse",
            theme: AppConstants.lightTheme,
            darkTheme: AppConstants.darkTheme,
            themeMode: provider.getThemeMode(),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRoutes.router,
          ),
        ),
      ),
    );
  }
}
