// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_recommendations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeRecommendations _$AnimeRecommendationsFromJson(
        Map<String, dynamic> json) =>
    AnimeRecommendations(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AnimeRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

AnimeRecommendation _$AnimeRecommendationFromJson(Map<String, dynamic> json) =>
    AnimeRecommendation(
      entry: json['entry'] == null
          ? null
          : Entry.fromJson(json['entry'] as Map<String, dynamic>),
      url: json['url'] as String?,
      votes: (json['votes'] as num?)?.toInt(),
    );

Entry _$EntryFromJson(Map<String, dynamic> json) => Entry(
      malId: (json['mal_id'] as num?)?.toInt(),
      url: json['url'] as String?,
      images: (json['images'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Image.fromJson(e as Map<String, dynamic>)),
      ),
      title: json['title'] as String?,
    );
