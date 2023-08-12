import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user.model.freezed.dart';
part 'user.model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    Auth? auth,
    User? user,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class Auth with _$Auth {
  const factory Auth({
    String? token_type,
    int? expires_in,
    String? access_token,
    String? refresh_token,
  }) = _Auth;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    int? id,
    String? name,
    String? email,
    String? phone_number,
    required dynamic otp,
    required dynamic email_verified_at,
    DateTime? created_at,
    DateTime? updated_at,
    required dynamic deleted_at,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
