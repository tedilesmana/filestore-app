import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'category.model.freezed.dart';
part 'category.model.g.dart';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    int? id,
    String? code,
    String? name,
    String? image_url,
    DateTime? created_at,
    DateTime? updated_at,
    required dynamic deleted_at,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
