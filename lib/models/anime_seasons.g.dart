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

AnimeInfo _$DatumFromJson(Map<String, dynamic> json) => AnimeInfo(
      malId: (json['mal_id'] as num?)?.toInt(),
      url: json['url'] as String?,
      images: (json['images'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Image.fromJson(e as Map<String, dynamic>)),
      ),
      trailer: json['trailer'] == null
          ? null
          : Trailer.fromJson(json['trailer'] as Map<String, dynamic>),
      approved: json['approved'] as bool?,
      titles: (json['titles'] as List<dynamic>?)
          ?.map((e) => Title.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      titleEnglish: json['title_english'] as String?,
      titleJapanese: json['title_japanese'] as String?,
      titleSynonyms: (json['title_synonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      type: json['type'] as String?,
      source: json['source'] as String?,
      episodes: (json['episodes'] as num?)?.toInt(),
      status: json['status'] as String?,
      airing: json['airing'] as bool?,
      aired: json['aired'] == null
          ? null
          : Aired.fromJson(json['aired'] as Map<String, dynamic>),
      duration: json['duration'] as String?,
      rating: json['rating'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      scoredBy: (json['scored_by'] as num?)?.toInt(),
      rank: (json['rank'] as num?)?.toInt(),
      popularity: (json['popularity'] as num?)?.toInt(),
      members: (json['members'] as num?)?.toInt(),
      favorites: (json['favorites'] as num?)?.toInt(),
      synopsis: json['synopsis'] as String?,
      background: json['background'] as String?,
      season: json['season'] as String?,
      year: (json['year'] as num?)?.toInt(),
      broadcast: json['broadcast'] == null
          ? null
          : Broadcast.fromJson(json['broadcast'] as Map<String, dynamic>),
      producers: (json['producers'] as List<dynamic>?)
          ?.map((e) => Demographic.fromJson(e as Map<String, dynamic>))
          .toList(),
      licensors: (json['licensors'] as List<dynamic>?)
          ?.map((e) => Demographic.fromJson(e as Map<String, dynamic>))
          .toList(),
      studios: (json['studios'] as List<dynamic>?)
          ?.map((e) => Demographic.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Demographic.fromJson(e as Map<String, dynamic>))
          .toList(),
      explicitGenres: json['explicit_genres'] as List<dynamic>?,
      themes: (json['themes'] as List<dynamic>?)
          ?.map((e) => Demographic.fromJson(e as Map<String, dynamic>))
          .toList(),
      demographics: (json['demographics'] as List<dynamic>?)
          ?.map((e) => Demographic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Aired _$AiredFromJson(Map<String, dynamic> json) => Aired(
      from:
          json['from'] == null ? null : DateTime.parse(json['from'] as String),
      to: json['to'] == null ? null : DateTime.parse(json['to'] as String),
      prop: json['prop'] == null
          ? null
          : Prop.fromJson(json['prop'] as Map<String, dynamic>),
      string: json['string'] as String?,
    );

Prop _$PropFromJson(Map<String, dynamic> json) => Prop(
      from: json['from'] == null
          ? null
          : From.fromJson(json['from'] as Map<String, dynamic>),
      to: json['to'] == null
          ? null
          : From.fromJson(json['to'] as Map<String, dynamic>),
    );

From _$FromFromJson(Map<String, dynamic> json) => From(
      day: (json['day'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
    );

Broadcast _$BroadcastFromJson(Map<String, dynamic> json) => Broadcast(
      day: json['day'] as String?,
      time: json['time'] as String?,
      timezone: json['timezone'] as String?,
      string: json['string'] as String?,
    );

Demographic _$DemographicFromJson(Map<String, dynamic> json) => Demographic(
      malId: (json['mal_id'] as num?)?.toInt(),
      type: json['type'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      imageUrl: json['image_url'] as String?,
      smallImageUrl: json['small_image_url'] as String?,
      largeImageUrl: json['large_image_url'] as String?,
    );

Title _$TitleFromJson(Map<String, dynamic> json) => Title(
      type: json['type'] as String?,
      title: json['title'] as String?,
    );

Trailer _$TrailerFromJson(Map<String, dynamic> json) => Trailer(
      youtubeId: json['youtube_id'] as String?,
      url: json['url'] as String?,
      embedUrl: json['embed_url'] as String?,
      images: json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
    );

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      imageUrl: json['image_url'] as String?,
      smallImageUrl: json['small_image_url'] as String?,
      mediumImageUrl: json['medium_image_url'] as String?,
      largeImageUrl: json['large_image_url'] as String?,
      maximumImageUrl: json['maximum_image_url'] as String?,
    );

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      lastVisiblePage: (json['last_visible_page'] as num?)?.toInt(),
      hasNextPage: json['has_next_page'] as bool?,
      currentPage: (json['current_page'] as num?)?.toInt(),
      items: json['items'] == null
          ? null
          : Items.fromJson(json['items'] as Map<String, dynamic>),
    );

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      count: (json['count'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
    );
