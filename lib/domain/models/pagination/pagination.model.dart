// To parse this JSON data, do
//
//     final paginationModel = paginationModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'pagination.model.freezed.dart';
part 'pagination.model.g.dart';

PaginationModel paginationModelFromJson(String str) => PaginationModel.fromJson(json.decode(str));

String paginationModelToJson(PaginationModel data) => json.encode(data.toJson());

@freezed
class PaginationModel with _$PaginationModel {
    const factory PaginationModel({
        int? current_page,
        String? first_page_url,
        required dynamic from,
        int? last_page,
        String? last_page_url,
        required dynamic next_page_url,
        String? path,
        int? per_page,
        required dynamic prev_page_url,
        required dynamic to,
        int? total,
    }) = _PaginationModel;

    factory PaginationModel.fromJson(Map<String, dynamic> json) => _$PaginationModelFromJson(json);
}
