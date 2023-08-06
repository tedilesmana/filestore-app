// To parse this JSON data, do
//
//     final fileUploadModel = fileUploadModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'file_upload.model.freezed.dart';
part 'file_upload.model.g.dart';

FileUploadModel fileUploadModelFromJson(String str) =>
    FileUploadModel.fromJson(json.decode(str));

String fileUploadModelToJson(FileUploadModel data) =>
    json.encode(data.toJson());

@freezed
class FileUploadModel with _$FileUploadModel {
  const factory FileUploadModel({
    String? pathURL,
    int? size,
    String? extention,
    String? fileNameWithExt,
    String? directory,
    String? filename,
  }) = _FileUploadModel;

  factory FileUploadModel.fromJson(Map<String, dynamic> json) =>
      _$FileUploadModelFromJson(json);
}
