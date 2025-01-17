import 'package:ani_verse/data/repository/anime_repository.dart';
import 'package:ani_verse/domain/repository/anime_repository.dart';
import 'package:ani_verse/presentation/provider/anime_provider.dart';
import 'package:ani_verse/presentation/provider/color_provider.dart';
import 'package:ani_verse/presentation/provider/settings_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final gI = GetIt.I;

Future<void> configureDeps() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  gI.registerSingleton(sp);

  gI.registerSingleton<AnimeRepository>(AnimeRepositoryImpl());

  gI.registerFactory(() => SettingsProvider(gI.get()));
  gI.registerFactory(() => AnimeProvider(gI.get()));
  gI.registerFactory(() => ColorProvider());
}
