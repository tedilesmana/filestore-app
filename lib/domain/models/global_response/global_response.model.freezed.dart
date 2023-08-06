// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_response.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GlobalResponse _$GlobalResponseFromJson(Map<String, dynamic> json) {
  return _GlobalResponse.fromJson(json);
}

/// @nodoc
mixin _$GlobalResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;
  dynamic get pagination => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GlobalResponseCopyWith<GlobalResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalResponseCopyWith<$Res> {
  factory $GlobalResponseCopyWith(
          GlobalResponse value, $Res Function(GlobalResponse) then) =
      _$GlobalResponseCopyWithImpl<$Res, GlobalResponse>;
  @useResult
  $Res call({bool success, String message, dynamic data, dynamic pagination});
}

/// @nodoc
class _$GlobalResponseCopyWithImpl<$Res, $Val extends GlobalResponse>
    implements $GlobalResponseCopyWith<$Res> {
  _$GlobalResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
    Object? pagination = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GlobalResponseCopyWith<$Res>
    implements $GlobalResponseCopyWith<$Res> {
  factory _$$_GlobalResponseCopyWith(
          _$_GlobalResponse value, $Res Function(_$_GlobalResponse) then) =
      __$$_GlobalResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, dynamic data, dynamic pagination});
}

/// @nodoc
class __$$_GlobalResponseCopyWithImpl<$Res>
    extends _$GlobalResponseCopyWithImpl<$Res, _$_GlobalResponse>
    implements _$$_GlobalResponseCopyWith<$Res> {
  __$$_GlobalResponseCopyWithImpl(
      _$_GlobalResponse _value, $Res Function(_$_GlobalResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
    Object? pagination = freezed,
  }) {
    return _then(_$_GlobalResponse(
      null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GlobalResponse implements _GlobalResponse {
  const _$_GlobalResponse(
      this.success, this.message, this.data, this.pagination);

  factory _$_GlobalResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GlobalResponseFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final dynamic data;
  @override
  final dynamic pagination;

  @override
  String toString() {
    return 'GlobalResponse(success: $success, message: $message, data: $data, pagination: $pagination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GlobalResponse &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality()
                .equals(other.pagination, pagination));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      success,
      message,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(pagination));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GlobalResponseCopyWith<_$_GlobalResponse> get copyWith =>
      __$$_GlobalResponseCopyWithImpl<_$_GlobalResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GlobalResponseToJson(
      this,
    );
  }
}

abstract class _GlobalResponse implements GlobalResponse {
  const factory _GlobalResponse(final bool success, final String message,
      final dynamic data, final dynamic pagination) = _$_GlobalResponse;

  factory _GlobalResponse.fromJson(Map<String, dynamic> json) =
      _$_GlobalResponse.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  dynamic get data;
  @override
  dynamic get pagination;
  @override
  @JsonKey(ignore: true)
  _$$_GlobalResponseCopyWith<_$_GlobalResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
