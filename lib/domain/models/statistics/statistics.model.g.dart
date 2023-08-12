// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StatisticsModel _$$_StatisticsModelFromJson(Map<String, dynamic> json) =>
    _$_StatisticsModel(
      category_id: json['category_id'] as int?,
      total: json['total'] as int?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StatisticsModelToJson(_$_StatisticsModel instance) =>
    <String, dynamic>{
      'category_id': instance.category_id,
      'total': instance.total,
      'category': instance.category,
    };

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deleted_at: json['deleted_at'],
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'deleted_at': instance.deleted_at,
    };
