import 'package:ani_verse/data/models/anime_info.dart';
import 'package:ani_verse/data/models/anime_list.dart';
import 'package:ani_verse/data/models/anime_recommendations.dart';
import 'package:result_dart/result_dart.dart';

import '../../app/enums.dart';

abstract class AnimeRepository {
  Future<Result<AnimeList>> getCurrentAnimeSeason([int? page, bool? forceOnline]);
  Future<Result<AnimeList>> getAnimeSeason(int year, AnimeSeason animeSeason, [int? page]);
  Future<Result<AnimeInfo>> getAnimeById(int id);
  Future<Result<AnimeRecommendations>> getAnimeRecommendations(int id);
  Future<Result<AnimeList>> getAnimeSearch({String? query,
    int? page, AnimeType? type,
    int? minScore, int? maxScore,
    AnimeStatus? status, AnimeOrderBy? orderBy,
    String? startLetter, String? startDate,
    String? endDate});
}