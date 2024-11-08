// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_seasons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeSeason _$AnimeSeasonFromJson(Map<String, dynamic> json) => AnimeSeason(
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AnimeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
