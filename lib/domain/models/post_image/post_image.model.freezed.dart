// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_image.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostImageModel _$PostImageModelFromJson(Map<String, dynamic> json) {
  return _PostImageModel.fromJson(json);
}

/// @nodoc
mixin _$PostImageModel {
  String? get base64Image => throw _privateConstructorUsedError;
  dynamic get file => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostImageModelCopyWith<PostImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostImageModelCopyWith<$Res> {
  factory $PostImageModelCopyWith(
          PostImageModel value, $Res Function(PostImageModel) then) =
      _$PostImageModelCopyWithImpl<$Res, PostImageModel>;
  @useResult
  $Res call({String? base64Image, dynamic file});
}

/// @nodoc
class _$PostImageModelCopyWithImpl<$Res, $Val extends PostImageModel>
    implements $PostImageModelCopyWith<$Res> {
  _$PostImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base64Image = freezed,
    Object? file = freezed,
  }) {
    return _then(_value.copyWith(
      base64Image: freezed == base64Image
          ? _value.base64Image
          : base64Image // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostImageModelCopyWith<$Res>
    implements $PostImageModelCopyWith<$Res> {
  factory _$$_PostImageModelCopyWith(
          _$_PostImageModel value, $Res Function(_$_PostImageModel) then) =
      __$$_PostImageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? base64Image, dynamic file});
}

/// @nodoc
class __$$_PostImageModelCopyWithImpl<$Res>
    extends _$PostImageModelCopyWithImpl<$Res, _$_PostImageModel>
    implements _$$_PostImageModelCopyWith<$Res> {
  __$$_PostImageModelCopyWithImpl(
      _$_PostImageModel _value, $Res Function(_$_PostImageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base64Image = freezed,
    Object? file = freezed,
  }) {
    return _then(_$_PostImageModel(
      base64Image: freezed == base64Image
          ? _value.base64Image
          : base64Image // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostImageModel implements _PostImageModel {
  const _$_PostImageModel({this.base64Image, required this.file});

  factory _$_PostImageModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostImageModelFromJson(json);

  @override
  final String? base64Image;
  @override
  final dynamic file;

  @override
  String toString() {
    return 'PostImageModel(base64Image: $base64Image, file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostImageModel &&
            (identical(other.base64Image, base64Image) ||
                other.base64Image == base64Image) &&
            const DeepCollectionEquality().equals(other.file, file));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, base64Image, const DeepCollectionEquality().hash(file));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostImageModelCopyWith<_$_PostImageModel> get copyWith =>
      __$$_PostImageModelCopyWithImpl<_$_PostImageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostImageModelToJson(
      this,
    );
  }
}

abstract class _PostImageModel implements PostImageModel {
  const factory _PostImageModel(
      {final String? base64Image,
      required final dynamic file}) = _$_PostImageModel;

  factory _PostImageModel.fromJson(Map<String, dynamic> json) =
      _$_PostImageModel.fromJson;

  @override
  String? get base64Image;
  @override
  dynamic get file;
  @override
  @JsonKey(ignore: true)
  _$$_PostImageModelCopyWith<_$_PostImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
