import 'dart:convert';
import 'dart:io';

import 'package:ani_verse/data/models/anime_info.dart';
import 'package:ani_verse/data/models/anime_list.dart';
import 'package:ani_verse/data/models/anime_recommendations.dart';
import 'package:ani_verse/domain/repositorys/anime_repository.dart';
import 'package:http/http.dart' as http;
import 'package:result_dart/result_dart.dart';

class JikanApi {
  final String _base = "api.jikan.moe";

  Future<Result<String>> _request(String resPath, [Map<String, dynamic>? prams]) async {
    final url = Uri.https(_base, "v4/$resPath", prams);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return Success(response.body);
      } else {
        return Exception("Error Code: ${response.statusCode}, ${response.reasonPhrase}").toFailure();
      }
    } catch (e) {
      return e is HttpException ? e.toFailure() : Exception("Unknown error try again later").toFailure();
    }
  }

  Future<Result<AnimeList>> getAnimeSeason(int year, AnimeSeason animeSeason, [int? page]) {
    return _request("seasons/$year/${animeSeason.toString()}", {"page": page.toString(), "sfw": ""})
        .then<Result<AnimeList>>((body) {
      return body.fold((data) => Success(AnimeList.fromJson(jsonDecode(data))), (error) => error.toFailure());
    });
  }

  Future<Result<AnimeList>> getCurrentAnimeSeason([int? page]) {
    return _request("seasons/now", {"page": page.toString(), "sfw": ""}).then<Result<AnimeList>>((body) {
      return body.fold((data) => Success(AnimeList.fromJson(jsonDecode(data))), (error) => error.toFailure());
    });
  }

  Future<Result<AnimeInfo>> getAnimeById(int id) {
    return _request("anime/$id").then<Result<AnimeInfo>>((body) {
      return body.fold((data) => Success(AnimeInfo.fromJson(jsonDecode(data))), (error) => error.toFailure());
    });
  }

  Future<Result<AnimeRecommendations>> getAnimeRecommendations(int id) {
    return _request("anime/$id/recommendations").then<Result<AnimeRecommendations>>((body) {
      return body.fold(
          (data) => Success(AnimeRecommendations.fromJson(jsonDecode(data))), (error) => error.toFailure());
    });
  }

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

    return _request("anime", props).then<Result<AnimeList>>((body) {
      return body.fold((data) => Success(AnimeList.fromJson(jsonDecode(data))), (error) => error.toFailure());
    });
  }
}
