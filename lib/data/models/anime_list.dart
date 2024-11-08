import 'package:json_annotation/json_annotation.dart';

import 'anime_info.dart';
import 'pagination.dart';

part 'anime_list.g.dart';

@JsonSerializable(createToJson: false)
class AnimeList {
  AnimeList({
    required this.pagination,
    required this.data,
  });

  final Pagination? pagination;
  final List<AnimeInfo>? data;

  factory AnimeList.fromJson(Map<String, dynamic> json) => _$AnimeListFromJson(json);
}
