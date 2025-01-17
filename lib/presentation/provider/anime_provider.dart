import 'package:ani_verse/data/models/anime_info.dart';
import 'package:ani_verse/data/models/anime_list.dart';
import 'package:ani_verse/domain/repository/anime_repository.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

class AnimeProvider extends ChangeNotifier {
  final AnimeRepository _animeRepository;

  AnimeProvider(this._animeRepository);

  int _page = 1;
  bool _isLoading = true;
  bool _isError = false;
  String? _errorMessage = "";
  AnimeList? _animeData;

  bool get isLoading => _isLoading;

  bool get isError => _isError;

  String? get errorMessage => _errorMessage;

  List<AnimeInfo>? get animeData => _animeData?.data;

  void fetchCurrentAnimeData() async {
    _isLoading = true;
    final result = await _animeRepository.getCurrentAnimeSeason(_page).timeout(
          const Duration(seconds: 100),
          onTimeout: () => Exception(
            "Server took too long to Respond please check your internet and try later",
          ).toFailure(),
        );

    result.fold(
      (success) {
        _filterAnimeList(success.data ?? []);
        _animeData = success;
      },
      (failure) {
        _isError = true;
        _errorMessage = failure.toString();
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  void fetchMoreAnime() async {
    if (!(_animeData?.pagination?.hasNextPage ?? false)) {
      return;
    }

    _page += 1;
    final result = await _animeRepository.getCurrentAnimeSeason(_page).timeout(
          const Duration(seconds: 100),
          onTimeout: () => Exception(
            "Server took too long to Respond please check your internet and try later",
          ).toFailure(),
        );

    result.fold(
      (success) {
        _filterAnimeList(success.data ?? []);
        _animeData?.data?.addAll(success.data ?? []);
      },
      (failure) {
        _isError = true;
        _errorMessage = failure.toString();
      },
    );

    notifyListeners();
  }

  void _filterAnimeList(List<AnimeInfo> animeList) {
    animeList.removeWhere(
      (element) {
        return element.status == "Not yet aired" || element.status == "Finished Airing";
      },
    );
    animeList.removeWhere(
      (p1) => !animeList.any(
        (p2) => p1.title == p2.title,
      ),
    );
  }
}
