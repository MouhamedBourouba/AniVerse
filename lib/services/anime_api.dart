import 'dart:convert';

import 'package:ani_verse/models/anime_info.dart';
import 'package:ani_verse/models/anime_recommendations.dart';
import 'package:http/http.dart' as http;

import '../models/anime_seasons.dart';

enum Season {
  winter,
  summer,
  spring,
  fall;

  @override
  String toString() {
    switch(this) {
      case Season.winter:
        return "winter";
      case Season.summer:
        return "summer";
      case Season.spring:
        return "spring";
      case Season.fall:
        return "fall";
    }
  }
}

abstract class AnimeApi {
  Future<AnimeSeason> getCurrentAnimeSeason(int page);
  Future<AnimeSeason> getAnimeSeason(int year, Season animeSeason, int page);
  Future<AnimeInfo> getAnimeById(int id);
  Future<AnimeRecommendations> getAnimeRecommendations(int id);
}


class JikanApi implements AnimeApi {
  final String _base = "api.jikan.moe";

  Future<String> _request(String resPath, [Map<String, dynamic>? prams]) async {
    final url = Uri.https(_base, "v4/$resPath", prams);
    try {
      final response = await http.get(url);

      if(response.statusCode == 200) {
        return response.body;
      }

      else {
        return Future.error("Error Code: ${response.statusCode}, ${response.reasonPhrase}");
      }
    } catch(e) {
      return Future.error(e);
    }
  }

  @override
  Future<AnimeSeason> getAnimeSeason(int year, Season animeSeason, int page) {
    return _request("seasons/$year/${animeSeason.toString()}", {"page": page})
        .then<AnimeSeason>((body) {
          return AnimeSeason.fromJson(jsonDecode(body));
        });
  }

  @override
  Future<AnimeSeason> getCurrentAnimeSeason(int page) {
    return _request("seasons/now", {"page": page})
        .then<AnimeSeason>((body) {
      return AnimeSeason.fromJson(jsonDecode(body));
    });
  }

  @override
  Future<AnimeInfo> getAnimeById(int id) {
    return _request("anime/id/", {"id": id})
        .then<AnimeInfo>((body) {
      return AnimeInfo.fromJson(jsonDecode(body));
    });
  }

  @override
  Future<AnimeRecommendations> getAnimeRecommendations(int id) {
    throw UnimplementedError();
  }
}