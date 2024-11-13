import 'dart:convert';
import 'dart:io';

import 'package:ani_verse/data/models/anime_info.dart';
import 'package:ani_verse/data/models/anime_list.dart';
import 'package:ani_verse/data/models/anime_recommendations.dart';
import 'package:ani_verse/domain/repositorys/anime_repository.dart';
import 'package:http/http.dart' as http;

import '../../domain/result.dart';

class JikanAnimeRepositoryImpl implements AnimeRepository {
  final String _base = "api.jikan.moe";

  Future<Result<String>> _request(String resPath, [Map<String, dynamic>? prams]) async {
    final url = Uri.https(_base, "v4/$resPath", prams);
    try {
      final response = await http.get(url);

      if(response.statusCode == 200) {
        return Success(response.body);
      }
      else {
        return Error("Error Code: ${response.statusCode}, ${response.reasonPhrase}");
      }
    } catch(e) {
      return e is HttpException ?
        Error(e.message) :
        Error("Unknown error try again later");
    }
  }

  @override
  Future<Result<AnimeList>> getAnimeSeason(int year, AnimeSeason animeSeason, [int? page]) {
    return _request("seasons/$year/${animeSeason.toString()}", {"page": page.toString(), "sfw": ""})
        .then<Result<AnimeList>>((body) {
          return switch(body) {
            Success<String>() => Success(AnimeList.fromJson(jsonDecode(body.data))),
            Error<String>() => Error(body.error),
      };
    });
  }

  @override
  Future<Result<AnimeList>> getCurrentAnimeSeason([int? page]) {
    return _request("seasons/now", {"page": page.toString(), "sfw": ""})
        .then((body) {
      return switch(body) {
        Success<String>() => Success(AnimeList.fromJson(jsonDecode(body.data))),
        Error<String>() => Error(body.error),
      };
    });
  }

  @override
  Future<Result<AnimeInfo>> getAnimeById(int id) {
    return _request("anime/$id")
        .then((body) {
      return switch(body) {
        Success<String>() => Success(AnimeInfo.fromJson(jsonDecode(body.data))),
        Error<String>() => Error(body.error),
      };
    });
  }

  @override
  Future<Result<AnimeRecommendations>> getAnimeRecommendations(int id) {
    return _request("anime/$id/recommendations")
        .then((body) {
      return switch(body) {
        Success<String>() => Success(AnimeRecommendations.fromJson(jsonDecode(body.data))),
        Error<String>() => Error(body.error),
      };
    });
  }

  @override
  Future<Result<AnimeList>> getAnimeSearch({String? query,
    int? page, AnimeType? type,
    int? minScore, int? maxScore,
    AnimeStatus? status, AnimeOrderBy? orderBy,
    String? startLetter, String? startDate,
    String? endDate}) {

    final props = <String, String>{ "sfw": "" };
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

    return _request("anime", props)
        .then((body) {
      return switch(body) {
        Success<String>() => Success(AnimeList.fromJson(jsonDecode(body.data))),
        Error<String>() => Error(body.error),
      };
    });
  }
}