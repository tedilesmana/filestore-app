// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginationModel _$$_PaginationModelFromJson(Map<String, dynamic> json) =>
    _$_PaginationModel(
      current_page: json['current_page'] as int?,
      first_page_url: json['first_page_url'] as String?,
      from: json['from'],
      last_page: json['last_page'] as int?,
      last_page_url: json['last_page_url'] as String?,
      next_page_url: json['next_page_url'],
      path: json['path'] as String?,
      per_page: json['per_page'] as int?,
      prev_page_url: json['prev_page_url'],
      to: json['to'],
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$_PaginationModelToJson(_$_PaginationModel instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'first_page_url': instance.first_page_url,
      'from': instance.from,
      'last_page': instance.last_page,
      'last_page_url': instance.last_page_url,
      'next_page_url': instance.next_page_url,
      'path': instance.path,
      'per_page': instance.per_page,
      'prev_page_url': instance.prev_page_url,
      'to': instance.to,
      'total': instance.total,
    };
