// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_store.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageStoreModel _$$_ImageStoreModelFromJson(Map<String, dynamic> json) =>
    _$_ImageStoreModel(
      name: json['name'] as String?,
      category: json['category'] as String?,
      description: json['description'] as String?,
      extention: json['extention'] as String?,
      size: json['size'] as int?,
      directory: json['directory'] as String?,
      image_url: json['image_url'] as String?,
      filename: json['filename'] as String?,
      code: json['code'] as String?,
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$_ImageStoreModelToJson(_$_ImageStoreModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'description': instance.description,
      'extention': instance.extention,
      'size': instance.size,
      'directory': instance.directory,
      'image_url': instance.image_url,
      'filename': instance.filename,
      'code': instance.code,
      'updated_at': instance.updated_at?.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
      'id': instance.id,
    };
