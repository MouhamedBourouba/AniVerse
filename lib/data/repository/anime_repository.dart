import 'dart:convert';

import 'package:ani_verse/data/models/anime_info.dart';
import 'package:ani_verse/data/models/anime_list.dart';
import 'package:ani_verse/data/models/anime_recommendations.dart';
import 'package:ani_verse/data/sources/jikan_api.dart';
import 'package:ani_verse/domain/repository/anime_repository.dart';
import 'package:result_dart/result_dart.dart';

import '../../app/enums.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  AnimeRepositoryImpl();

  @override
  Future<Result<AnimeInfo>> getAnimeById(int id) {
    return JikanApi.request("anime/$id").then<Result<AnimeInfo>>((body) {
      return body.fold(
          (data) => Success(AnimeInfo.fromJson(jsonDecode(data))), (error) => error.toFailure());
    });
  }

  @override
  Future<Result<AnimeRecommendations>> getAnimeRecommendations(int id) {
    return JikanApi.request("anime/$id/recommendations").then<Result<AnimeRecommendations>>((body) {
      return body.fold((data) => Success(AnimeRecommendations.fromJson(jsonDecode(data))),
          (error) => error.toFailure());
    });
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
    final props = <String, String>{"sfw": ""};
    if (query != null) props['q'] = query;
    if (page != null) props['page'] = page.toString();
    if (type != null) props['type'] = type.toString();
    if (minScore != null) props['minScore'] = minScore.toString();
    if (maxScore != null) props['maxScore'] = maxScore.toString();
    if (status != null) props['status'] = status.toString();
    if (orderBy != null) props['orderBy'] = orderBy.toString();
    if (startLetter != null) props['startLetter'] = startLetter;
    if (startDate != null) props['startDate'] = startDate;
    if (endDate != null) props['endDate'] = endDate;

    return JikanApi.request("anime", props).then<Result<AnimeList>>((body) {
      return body.fold(
          (data) => Success(AnimeList.fromJson(jsonDecode(data))), (error) => error.toFailure());
    });
  }

  @override
  Future<Result<AnimeList>> getAnimeSeason(int year, AnimeSeason animeSeason, [int? page]) {
    return JikanApi.request(
            "seasons/$year/${animeSeason.toString()}", {"page": page.toString(), "sfw": ""})
        .then<Result<AnimeList>>((body) {
      return body.fold(
          (data) => Success(AnimeList.fromJson(jsonDecode(data))), (error) => error.toFailure());
    });
  }

  @override
  Future<Result<AnimeList>> getCurrentAnimeSeason([int? page]) {
    return JikanApi.request("seasons/now", {"page": (page ?? 1).toString(), "sfw": ""})
        .then<Result<AnimeList>>((body) {
      return body.fold((data) => AnimeList.fromJson(jsonDecode(data)).toSuccess(), (error) => error.toFailure());
    });
  }
}
