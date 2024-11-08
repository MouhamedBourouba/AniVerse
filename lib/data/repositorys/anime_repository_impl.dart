import 'package:ani_verse/data/models/anime_info.dart';
import 'package:ani_verse/data/models/anime_list.dart';
import 'package:ani_verse/data/models/anime_recommendations.dart';
import 'package:ani_verse/data/sources/jikan_api.dart';
import 'package:ani_verse/data/sources/local_storage.dart';
import 'package:ani_verse/domain/repositorys/anime_repository.dart';
import 'package:ani_verse/domain/repositorys/result.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final JikanApi _api;
  final LocalStorage _localStorage;

  AnimeRepositoryImpl(this._api, this._localStorage);


  @override
  Future<Result<AnimeInfo>> getAnimeById(int id) async {
    try {
      final data = await _api.getAnimeById(id);
      _localStorage.saveAnimeInfo(data);
      return Success(data);
    } catch (e) {
      final data = await _localStorage.getAnimeById();
      return switch(data) {
        Success<AnimeInfo>() => data,
        Error<AnimeInfo>() => Error("Please check internet connection"),
      };
    }
  }

  @override
  Future<Result<AnimeRecommendations>> getAnimeRecommendations(int id) {
    // TODO: implement getAnimeRecommendations
    throw UnimplementedError();
  }

  @override
  Future<Result<AnimeList>> getAnimeSearch(
      {String? query, int? page, AnimeType? type, int? minScore, int? maxScore, AnimeStatus? status, AnimeOrderBy? orderBy, String? startLetter, String? startDate, String? endDate}) {
    // TODO: implement getAnimeSearch
    throw UnimplementedError();
  }

  @override
  Future<Result<AnimeList>> getAnimeSeason(int year, AnimeSeason animeSeason,
      [int? page]) {
    // TODO: implement getAnimeSeason
    throw UnimplementedError();
  }

  @override
  Future<Result<AnimeList>> getCurrentAnimeSeason([int? page]) {
    // TODO: implement getCurrentAnimeSeason
    throw UnimplementedError();
  }
}