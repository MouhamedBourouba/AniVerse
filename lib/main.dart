import 'package:ani_verse/app/app.dart';
import 'package:flutter/widgets.dart';

import 'data/repository/AnimeRepository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AnimeRepositoryImpl().getCurrentAnimeSeason();

  runApp(const AniVerse());
}

