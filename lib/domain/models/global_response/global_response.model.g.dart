// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GlobalResponse _$$_GlobalResponseFromJson(Map<String, dynamic> json) =>
    _$_GlobalResponse(
      json['success'] as bool,
      json['message'] as String,
      json['data'],
      json['pagination'],
    );

Map<String, dynamic> _$$_GlobalResponseToJson(_$_GlobalResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };
