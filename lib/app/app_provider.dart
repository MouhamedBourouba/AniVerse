import 'package:ani_verse/app/di.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../domain/repository/anime_repository.dart';
import '../presentation/provider/settings_provider.dart';

class AppProvider extends StatelessWidget {
  final Widget child;

  const AppProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsProvider>(create: (_) => gI.get()),
        Provider<AnimeRepository>(create: (_) => gI.get())
      ],
      child: child,
    );
  }
}
