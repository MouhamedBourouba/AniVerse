import 'package:json_annotation/json_annotation.dart';

part 'anime_seasons.g.dart';

@JsonSerializable(createToJson: false)
class AnimeSeason {
  AnimeSeason({
    required this.pagination,
    required this.data,
  });

  final Pagination? pagination;
  final List<Datum>? data;

  factory AnimeSeason.fromJson(Map<String, dynamic> json) => _$AnimeSeasonFromJson(json);

}

@JsonSerializable(createToJson: false)
class Datum {
  Datum({
    required this.malId,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.titles,
    required this.title,
    required this.titleEnglish,
    required this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    required this.episodes,
    required this.status,
    required this.airing,
    required this.aired,
    required this.duration,
    required this.rating,
    required this.score,
    required this.scoredBy,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    required this.season,
    required this.year,
    required this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
  });

  @JsonKey(name: 'mal_id')
  final int? malId;
  final String? url;
  final Map<String, Image>? images;
  final Trailer? trailer;
  final bool? approved;
  final List<Title>? titles;
  final String? title;

  @JsonKey(name: 'title_english')
  final String? titleEnglish;

  @JsonKey(name: 'title_japanese')
  final String? titleJapanese;

  @JsonKey(name: 'title_synonyms')
  final List<String>? titleSynonyms;
  final String? type;
  final String? source;
  final int? episodes;
  final String? status;
  final bool? airing;
  final Aired? aired;
  final String? duration;
  final String? rating;
  final double? score;

  @JsonKey(name: 'scored_by')
  final int? scoredBy;
  final int? rank;
  final int? popularity;
  final int? members;
  final int? favorites;
  final String? synopsis;
  final String? background;
  final String? season;
  final int? year;
  final Broadcast? broadcast;
  final List<Demographic>? producers;
  final List<Demographic>? licensors;
  final List<Demographic>? studios;
  final List<Demographic>? genres;

  @JsonKey(name: 'explicit_genres')
  final List<dynamic>? explicitGenres;
  final List<Demographic>? themes;
  final List<Demographic>? demographics;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

}

@JsonSerializable(createToJson: false)
class Aired {
  Aired({
    required this.from,
    required this.to,
    required this.prop,
    required this.string,
  });

  final DateTime? from;
  final DateTime? to;
  final Prop? prop;
  final String? string;

  factory Aired.fromJson(Map<String, dynamic> json) => _$AiredFromJson(json);

}

@JsonSerializable(createToJson: false)
class Prop {
  Prop({
    required this.from,
    required this.to,
  });

  final From? from;
  final From? to;

  factory Prop.fromJson(Map<String, dynamic> json) => _$PropFromJson(json);

}

@JsonSerializable(createToJson: false)
class From {
  From({
    required this.day,
    required this.month,
    required this.year,
  });

  final int? day;
  final int? month;
  final int? year;

  factory From.fromJson(Map<String, dynamic> json) => _$FromFromJson(json);

}

@JsonSerializable(createToJson: false)
class Broadcast {
  Broadcast({
    required this.day,
    required this.time,
    required this.timezone,
    required this.string,
  });

  final String? day;
  final String? time;
  final String? timezone;
  final String? string;

  factory Broadcast.fromJson(Map<String, dynamic> json) => _$BroadcastFromJson(json);

}

@JsonSerializable(createToJson: false)
class Demographic {
  Demographic({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  @JsonKey(name: 'mal_id')
  final int? malId;
  final String? type;
  final String? name;
  final String? url;

  factory Demographic.fromJson(Map<String, dynamic> json) => _$DemographicFromJson(json);

}

@JsonSerializable(createToJson: false)
class Image {
  Image({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'small_image_url')
  final String? smallImageUrl;

  @JsonKey(name: 'large_image_url')
  final String? largeImageUrl;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

}

@JsonSerializable(createToJson: false)
class Title {
  Title({
    required this.type,
    required this.title,
  });

  final String? type;
  final String? title;

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

}

@JsonSerializable(createToJson: false)
class Trailer {
  Trailer({
    required this.youtubeId,
    required this.url,
    required this.embedUrl,
    required this.images,
  });

  @JsonKey(name: 'youtube_id')
  final String? youtubeId;
  final String? url;

  @JsonKey(name: 'embed_url')
  final String? embedUrl;
  final Images? images;

  factory Trailer.fromJson(Map<String, dynamic> json) => _$TrailerFromJson(json);

}

@JsonSerializable(createToJson: false)
class Images {
  Images({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.mediumImageUrl,
    required this.largeImageUrl,
    required this.maximumImageUrl,
  });

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'small_image_url')
  final String? smallImageUrl;

  @JsonKey(name: 'medium_image_url')
  final String? mediumImageUrl;

  @JsonKey(name: 'large_image_url')
  final String? largeImageUrl;

  @JsonKey(name: 'maximum_image_url')
  final String? maximumImageUrl;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

}

@JsonSerializable(createToJson: false)
class Pagination {
  Pagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  @JsonKey(name: 'last_visible_page')
  final int? lastVisiblePage;

  @JsonKey(name: 'has_next_page')
  final bool? hasNextPage;

  @JsonKey(name: 'current_page')
  final int? currentPage;
  final Items? items;

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

}

@JsonSerializable(createToJson: false)
class Items {
  Items({
    required this.count,
    required this.total,
    required this.perPage,
  });

  final int? count;
  final int? total;

  @JsonKey(name: 'per_page')
  final int? perPage;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

}