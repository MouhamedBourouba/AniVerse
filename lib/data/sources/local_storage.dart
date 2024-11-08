import 'package:ani_verse/data/models/anime_info.dart';
import 'package:ani_verse/data/models/anime_list.dart';
import 'package:ani_verse/domain/repositorys/anime_repository.dart';
import 'package:ani_verse/domain/repositorys/result.dart';

class LocalStorage {
  Future<void> saveAnimeInfo(AnimeInfo anime) async {
  }

  Future<void> saveAnimeList(AnimeList anime) async {
    anime.data?.forEach(saveAnimeInfo);
  }

  Future<void> saveAnimeSeason(AnimeList anime, int year, AnimeSeason season) async {
  }

  Future<void> saveCurrentAnimeSeason(AnimeList anime, int year, AnimeSeason season) async {
  }

  Future<Result<AnimeInfo>> getAnimeById() async {
    return Error("Local Storage not implemented");
  }
}