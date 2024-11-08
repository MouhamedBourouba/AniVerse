import 'package:json_annotation/json_annotation.dart';

import 'anime_info.dart';
import 'pagination.dart';

part 'anime_seasons.g.dart';

@JsonSerializable(createToJson: false)
class AnimeSeason {
  AnimeSeason({
    required this.pagination,
    required this.data,
  });

  final Pagination? pagination;
  final List<AnimeInfo>? data;

  factory AnimeSeason.fromJson(Map<String, dynamic> json) => _$AnimeSeasonFromJson(json);
}
