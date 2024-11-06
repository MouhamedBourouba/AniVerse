import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/anime_seasons.dart';

enum Season {
  winter,
  summer,
  spring,
  fall
}

abstract class AnimeApi {
  Future<AnimeSeason> getCurrentAnimeSeason();
  Future<AnimeSeason> getAnimeSeason(int year, Season animeSeason);
}

class JikanApi implements AnimeApi {
  final String _base = "api.jikan.moe";

  Future<AnimeSeason> _getAnimeSeason(Uri url) async {
    try {
      final response = await http.get(url);
      if(response.statusCode == 200) {
        return AnimeSeason.fromJson(jsonDecode(response.body));
      }
      else {
        return Future.error("Error Code: ${response.statusCode}, ${response.reasonPhrase}");
      }
    } catch(e) {
      return Future.error(e);
    }
  }

  @override
  Future<AnimeSeason> getAnimeSeason(int year, Season animeSeason) {
    return _getAnimeSeason(Uri.https(_base, "seasons/$year/${animeSeason.toString()}"));
  }

  @override
  Future<AnimeSeason> getCurrentAnimeSeason() {
    return _getAnimeSeason(Uri.https(_base, "seasons/now"));
  }
}