import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_response.model.freezed.dart';
part 'global_response.model.g.dart';

@freezed
abstract class GlobalResponse with _$GlobalResponse {
  const factory GlobalResponse(
    bool success,
    String message,
    dynamic data,
    dynamic pagination,
  ) = _GlobalResponse;

  factory GlobalResponse.fromJson(Map<String, dynamic> json) =>
      _$GlobalResponseFromJson(json);
}
