import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

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
