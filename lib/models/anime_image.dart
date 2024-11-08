import 'package:json_annotation/json_annotation.dart';

part 'anime_image.g.dart';

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
