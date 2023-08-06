// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'post_image.model.freezed.dart';
part 'post_image.model.g.dart';

PostImageModel postImageModelFromJson(String str) =>
    PostImageModel.fromJson(json.decode(str));

String postImageModelToJson(PostImageModel data) => json.encode(data.toJson());

@freezed
class PostImageModel with _$PostImageModel {
  const factory PostImageModel({String? base64Image, required dynamic file}) =
      _PostImageModel;

  factory PostImageModel.fromJson(Map<String, dynamic> json) =>
      _$PostImageModelFromJson(json);
}
