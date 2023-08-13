
// ignore_for_file: non_constant_identifier_names

import 'package:filestore/domain/models/user/user.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'image_store.model.freezed.dart';
part 'image_store.model.g.dart';

ImageStoreModel imageStoreModelFromJson(String str) =>
    ImageStoreModel.fromJson(json.decode(str));

String imageStoreModelToJson(ImageStoreModel data) =>
    json.encode(data.toJson());

@freezed
class ImageStoreModel with _$ImageStoreModel {
  const factory ImageStoreModel({
    String? name,
    int? category_id,
    int? user_id,
    String? description,
    String? extention,
    int? size,
    User? user,
    String? directory,
    String? image_url,
    String? filename,
    String? code,
    DateTime? updated_at,
    DateTime? created_at,
    int? id,
  }) = _ImageStoreModel;

  factory ImageStoreModel.fromJson(Map<String, dynamic> json) =>
      _$ImageStoreModelFromJson(json);
}
