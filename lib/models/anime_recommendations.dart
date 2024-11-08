import 'package:json_annotation/json_annotation.dart';
import 'anime_image.dart';

part 'anime_recommendations.g.dart';

@JsonSerializable(createToJson: false)
class AnimeRecommendations {
  AnimeRecommendations({
    required this.data,
  });

  final List<AnimeRecommendation>? data;

  factory AnimeRecommendations.fromJson(Map<String, dynamic> json) => _$AnimeRecommendationsFromJson(json);
}

@JsonSerializable(createToJson: false)
class AnimeRecommendation {
  AnimeRecommendation({
    required this.entry,
    required this.url,
    required this.votes,
  });

  final Entry? entry;
  final String? url;
  final int? votes;

  factory AnimeRecommendation.fromJson(Map<String, dynamic> json) => _$AnimeRecommendationFromJson(json);
}

@JsonSerializable(createToJson: false)
class Entry {
  Entry({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  @JsonKey(name: 'mal_id')
  final int? malId;
  final String? url;
  final Map<String, Image>? images;
  final String? title;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
}