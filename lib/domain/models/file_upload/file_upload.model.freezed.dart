// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_upload.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FileUploadModel _$FileUploadModelFromJson(Map<String, dynamic> json) {
  return _FileUploadModel.fromJson(json);
}

/// @nodoc
mixin _$FileUploadModel {
  String? get pathURL => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  String? get extention => throw _privateConstructorUsedError;
  String? get fileNameWithExt => throw _privateConstructorUsedError;
  String? get directory => throw _privateConstructorUsedError;
  String? get filename => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileUploadModelCopyWith<FileUploadModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileUploadModelCopyWith<$Res> {
  factory $FileUploadModelCopyWith(
          FileUploadModel value, $Res Function(FileUploadModel) then) =
      _$FileUploadModelCopyWithImpl<$Res, FileUploadModel>;
  @useResult
  $Res call(
      {String? pathURL,
      int? size,
      String? extention,
      String? fileNameWithExt,
      String? directory,
      String? filename});
}

/// @nodoc
class _$FileUploadModelCopyWithImpl<$Res, $Val extends FileUploadModel>
    implements $FileUploadModelCopyWith<$Res> {
  _$FileUploadModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pathURL = freezed,
    Object? size = freezed,
    Object? extention = freezed,
    Object? fileNameWithExt = freezed,
    Object? directory = freezed,
    Object? filename = freezed,
  }) {
    return _then(_value.copyWith(
      pathURL: freezed == pathURL
          ? _value.pathURL
          : pathURL // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      extention: freezed == extention
          ? _value.extention
          : extention // ignore: cast_nullable_to_non_nullable
              as String?,
      fileNameWithExt: freezed == fileNameWithExt
          ? _value.fileNameWithExt
          : fileNameWithExt // ignore: cast_nullable_to_non_nullable
              as String?,
      directory: freezed == directory
          ? _value.directory
          : directory // ignore: cast_nullable_to_non_nullable
              as String?,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FileUploadModelCopyWith<$Res>
    implements $FileUploadModelCopyWith<$Res> {
  factory _$$_FileUploadModelCopyWith(
          _$_FileUploadModel value, $Res Function(_$_FileUploadModel) then) =
      __$$_FileUploadModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? pathURL,
      int? size,
      String? extention,
      String? fileNameWithExt,
      String? directory,
      String? filename});
}

/// @nodoc
class __$$_FileUploadModelCopyWithImpl<$Res>
    extends _$FileUploadModelCopyWithImpl<$Res, _$_FileUploadModel>
    implements _$$_FileUploadModelCopyWith<$Res> {
  __$$_FileUploadModelCopyWithImpl(
      _$_FileUploadModel _value, $Res Function(_$_FileUploadModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pathURL = freezed,
    Object? size = freezed,
    Object? extention = freezed,
    Object? fileNameWithExt = freezed,
    Object? directory = freezed,
    Object? filename = freezed,
  }) {
    return _then(_$_FileUploadModel(
      pathURL: freezed == pathURL
          ? _value.pathURL
          : pathURL // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      extention: freezed == extention
          ? _value.extention
          : extention // ignore: cast_nullable_to_non_nullable
              as String?,
      fileNameWithExt: freezed == fileNameWithExt
          ? _value.fileNameWithExt
          : fileNameWithExt // ignore: cast_nullable_to_non_nullable
              as String?,
      directory: freezed == directory
          ? _value.directory
          : directory // ignore: cast_nullable_to_non_nullable
              as String?,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FileUploadModel implements _FileUploadModel {
  const _$_FileUploadModel(
      {this.pathURL,
      this.size,
      this.extention,
      this.fileNameWithExt,
      this.directory,
      this.filename});

  factory _$_FileUploadModel.fromJson(Map<String, dynamic> json) =>
      _$$_FileUploadModelFromJson(json);

  @override
  final String? pathURL;
  @override
  final int? size;
  @override
  final String? extention;
  @override
  final String? fileNameWithExt;
  @override
  final String? directory;
  @override
  final String? filename;

  @override
  String toString() {
    return 'FileUploadModel(pathURL: $pathURL, size: $size, extention: $extention, fileNameWithExt: $fileNameWithExt, directory: $directory, filename: $filename)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FileUploadModel &&
            (identical(other.pathURL, pathURL) || other.pathURL == pathURL) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.extention, extention) ||
                other.extention == extention) &&
            (identical(other.fileNameWithExt, fileNameWithExt) ||
                other.fileNameWithExt == fileNameWithExt) &&
            (identical(other.directory, directory) ||
                other.directory == directory) &&
            (identical(other.filename, filename) ||
                other.filename == filename));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pathURL, size, extention,
      fileNameWithExt, directory, filename);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FileUploadModelCopyWith<_$_FileUploadModel> get copyWith =>
      __$$_FileUploadModelCopyWithImpl<_$_FileUploadModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FileUploadModelToJson(
      this,
    );
  }
}

abstract class _FileUploadModel implements FileUploadModel {
  const factory _FileUploadModel(
      {final String? pathURL,
      final int? size,
      final String? extention,
      final String? fileNameWithExt,
      final String? directory,
      final String? filename}) = _$_FileUploadModel;

  factory _FileUploadModel.fromJson(Map<String, dynamic> json) =
      _$_FileUploadModel.fromJson;

  @override
  String? get pathURL;
  @override
  int? get size;
  @override
  String? get extention;
  @override
  String? get fileNameWithExt;
  @override
  String? get directory;
  @override
  String? get filename;
  @override
  @JsonKey(ignore: true)
  _$$_FileUploadModelCopyWith<_$_FileUploadModel> get copyWith =>
      throw _privateConstructorUsedError;
}
