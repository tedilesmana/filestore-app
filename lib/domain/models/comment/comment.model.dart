// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'comment.model.freezed.dart';
part 'comment.model.g.dart';

CommentModel commentModelFromJson(String str) =>
    CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel({
    int? image_store_id,
    String? comment,
    String? code,
    DateTime? updated_at,
    DateTime? created_at,
    int? id,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
