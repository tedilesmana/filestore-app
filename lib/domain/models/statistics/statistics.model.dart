import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'statistics.model.freezed.dart';
part 'statistics.model.g.dart';

StatisticsModel statisticsModelFromJson(String str) =>
    StatisticsModel.fromJson(json.decode(str));

String statisticsModelToJson(StatisticsModel data) =>
    json.encode(data.toJson());

@freezed
class StatisticsModel with _$StatisticsModel {
  const factory StatisticsModel({
    int? category_id,
    int? total,
    Category? category,
  }) = _StatisticsModel;

  factory StatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticsModelFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    int? id,
    String? code,
    String? name,
    String? image_url,
    DateTime? created_at,
    DateTime? updated_at,
    required dynamic deleted_at,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
