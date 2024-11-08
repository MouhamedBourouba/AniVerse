import 'package:ani_verse/data/models/anime_info.dart';
import 'package:ani_verse/data/models/anime_list.dart';
import 'package:ani_verse/data/models/anime_recommendations.dart';
import 'package:ani_verse/domain/repositorys/result.dart';

enum AnimeSeason {
  winter,
  summer,
  spring,
  fall;

  @override
  String toString() {
    switch(this) {
      case AnimeSeason.winter:
        return "winter";
      case AnimeSeason.summer:
        return "summer";
      case AnimeSeason.spring:
        return "spring";
      case AnimeSeason.fall:
        return "fall";
    }
  }
}

enum AnimeType {
  tv,
  ova,
  ona,
  movie,
  special;

  @override
  String toString() {
    switch(this) {
      case AnimeType.tv:
        return "tv";
      case AnimeType.ova:
        return "ova";
      case AnimeType.ona:
        return "ona";
      case AnimeType.movie:
        return "movie";
      case AnimeType.special:
        return "special";
    }
  }
}

enum AnimeStatus {
  airing,
  complete,
  upcoming;

  @override
  String toString() {
    switch(this) {
      case AnimeStatus.airing:
        return "airing";
      case AnimeStatus.complete:
        return "complete";
      case AnimeStatus.upcoming:
        return "upcoming";
    }
  }
}

enum AnimeOrderBy {
  malId,
  title,
  startDate,
  endDate,
  episodes,
  score,
  scoredBy,
  rank,
  popularity,
  members,
  favorites;

  @override
  String toString() {
    switch(this) {
      case AnimeOrderBy.malId:
        return "malId";
      case AnimeOrderBy.title:
        return "title";
      case AnimeOrderBy.startDate:
        return "startDate";
      case AnimeOrderBy.endDate:
        return "endDate";
      case AnimeOrderBy.episodes:
        return "episodes";
      case AnimeOrderBy.score:
        return "score";
      case AnimeOrderBy.scoredBy:
        return "scoredBy";
      case AnimeOrderBy.rank:
        return "rank";
      case AnimeOrderBy.popularity:
        return "popularity";
      case AnimeOrderBy.members:
        return "members";
      case AnimeOrderBy.favorites:
        return "favorites";
    }
  }
}

abstract class AnimeRepository {
  Future<Result<AnimeList>> getCurrentAnimeSeason([int? page]);
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