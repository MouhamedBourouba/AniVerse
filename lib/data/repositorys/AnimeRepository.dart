import 'package:ani_verse/data/models/anime_info.dart';
import 'package:ani_verse/data/models/anime_list.dart';
import 'package:ani_verse/data/models/anime_recommendations.dart';
import 'package:ani_verse/data/sources/jikan_api.dart';
import 'package:ani_verse/domain/repositorys/anime_repository.dart';
import 'package:result_dart/result_dart.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final JikanApi api;

  AnimeRepositoryImpl(this.api);

  @override
  Future<Result<AnimeInfo>> getAnimeById(int id) {
    return api.getAnimeById(id);
  }

  @override
  Future<Result<AnimeRecommendations>> getAnimeRecommendations(int id) {
    return api.getAnimeRecommendations(id);
  }

  @override
  Future<Result<AnimeList>> getAnimeSearch(
      {String? query,
      int? page,
      AnimeType? type,
      int? minScore,
      int? maxScore,
      AnimeStatus? status,
      AnimeOrderBy? orderBy,
      String? startLetter,
      String? startDate,
      String? endDate}) {
    return api.getAnimeSearch(
        query: query,
        page: page,
        type: type,
        maxScore: maxScore,
        minScore: minScore,
        endDate: endDate,
        orderBy: orderBy,
        startDate: startDate,
        startLetter: startLetter,
        status: status);
  }

  @override
  Future<Result<AnimeList>> getAnimeSeason(int year, AnimeSeason animeSeason, [int? page]) {
    return api.getAnimeSeason(year, animeSeason);
  }

  @override
  Future<Result<AnimeList>> getCurrentAnimeSeason([int? page]) {
    return getCurrentAnimeSeason(page);
  }
}
