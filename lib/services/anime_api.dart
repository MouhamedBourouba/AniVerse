import 'dart:convert';
import 'dart:ffi';

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
  Future<AnimeSeason> getAnimeSeason(UnsignedInt year, Season animeSeason);
  void dispose();
}

class JikanApi implements AnimeApi {
  final String _base = "api.jikan.moe";
  final _client = http.Client();

  Future<AnimeSeason> _getAnimeSeason(Uri url) async {
    try {
      final response = await _client.get(url);
      return AnimeSeason.fromJson(jsonDecode(response.body));
    } catch(e) {
      return Future.error(e);
    }
  }

  @override
  Future<AnimeSeason> getAnimeSeason(UnsignedInt year, Season animeSeason) {
    return _getAnimeSeason(Uri.https(_base, "seasons/$year/${animeSeason.toString()}"));
  }

  @override
  Future<AnimeSeason> getCurrentAnimeSeason() {
    return _getAnimeSeason(Uri.https(_base, "seasons/now"));
  }

  @override
  void dispose() {
    _client.close();
  }
}