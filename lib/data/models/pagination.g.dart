// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
