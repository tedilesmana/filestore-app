// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_store.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageStoreModel _$ImageStoreModelFromJson(Map<String, dynamic> json) {
  return _ImageStoreModel.fromJson(json);
}

/// @nodoc
mixin _$ImageStoreModel {
  String? get name => throw _privateConstructorUsedError;
  int? get category_id => throw _privateConstructorUsedError;
  int? get user_id => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get extention => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String? get directory => throw _privateConstructorUsedError;
  String? get image_url => throw _privateConstructorUsedError;
  String? get filename => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  DateTime? get updated_at => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageStoreModelCopyWith<ImageStoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageStoreModelCopyWith<$Res> {
  factory $ImageStoreModelCopyWith(
          ImageStoreModel value, $Res Function(ImageStoreModel) then) =
      _$ImageStoreModelCopyWithImpl<$Res, ImageStoreModel>;
  @useResult
  $Res call(
      {String? name,
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
      int? id});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$ImageStoreModelCopyWithImpl<$Res, $Val extends ImageStoreModel>
    implements $ImageStoreModelCopyWith<$Res> {
  _$ImageStoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? category_id = freezed,
    Object? user_id = freezed,
    Object? description = freezed,
    Object? extention = freezed,
    Object? size = freezed,
    Object? user = freezed,
    Object? directory = freezed,
    Object? image_url = freezed,
    Object? filename = freezed,
    Object? code = freezed,
    Object? updated_at = freezed,
    Object? created_at = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      category_id: freezed == category_id
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as int?,
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      extention: freezed == extention
          ? _value.extention
          : extention // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      directory: freezed == directory
          ? _value.directory
          : directory // ignore: cast_nullable_to_non_nullable
              as String?,
      image_url: freezed == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ImageStoreModelCopyWith<$Res>
    implements $ImageStoreModelCopyWith<$Res> {
  factory _$$_ImageStoreModelCopyWith(
          _$_ImageStoreModel value, $Res Function(_$_ImageStoreModel) then) =
      __$$_ImageStoreModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
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
      int? id});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_ImageStoreModelCopyWithImpl<$Res>
    extends _$ImageStoreModelCopyWithImpl<$Res, _$_ImageStoreModel>
    implements _$$_ImageStoreModelCopyWith<$Res> {
  __$$_ImageStoreModelCopyWithImpl(
      _$_ImageStoreModel _value, $Res Function(_$_ImageStoreModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? category_id = freezed,
    Object? user_id = freezed,
    Object? description = freezed,
    Object? extention = freezed,
    Object? size = freezed,
    Object? user = freezed,
    Object? directory = freezed,
    Object? image_url = freezed,
    Object? filename = freezed,
    Object? code = freezed,
    Object? updated_at = freezed,
    Object? created_at = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_ImageStoreModel(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      category_id: freezed == category_id
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as int?,
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      extention: freezed == extention
          ? _value.extention
          : extention // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      directory: freezed == directory
          ? _value.directory
          : directory // ignore: cast_nullable_to_non_nullable
              as String?,
      image_url: freezed == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageStoreModel implements _ImageStoreModel {
  const _$_ImageStoreModel(
      {this.name,
      this.category_id,
      this.user_id,
      this.description,
      this.extention,
      this.size,
      this.user,
      this.directory,
      this.image_url,
      this.filename,
      this.code,
      this.updated_at,
      this.created_at,
      this.id});

  factory _$_ImageStoreModel.fromJson(Map<String, dynamic> json) =>
      _$$_ImageStoreModelFromJson(json);

  @override
  final String? name;
  @override
  final int? category_id;
  @override
  final int? user_id;
  @override
  final String? description;
  @override
  final String? extention;
  @override
  final int? size;
  @override
  final User? user;
  @override
  final String? directory;
  @override
  final String? image_url;
  @override
  final String? filename;
  @override
  final String? code;
  @override
  final DateTime? updated_at;
  @override
  final DateTime? created_at;
  @override
  final int? id;

  @override
  String toString() {
    return 'ImageStoreModel(name: $name, category_id: $category_id, user_id: $user_id, description: $description, extention: $extention, size: $size, user: $user, directory: $directory, image_url: $image_url, filename: $filename, code: $code, updated_at: $updated_at, created_at: $created_at, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageStoreModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category_id, category_id) ||
                other.category_id == category_id) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.extention, extention) ||
                other.extention == extention) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.directory, directory) ||
                other.directory == directory) &&
            (identical(other.image_url, image_url) ||
                other.image_url == image_url) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      category_id,
      user_id,
      description,
      extention,
      size,
      user,
      directory,
      image_url,
      filename,
      code,
      updated_at,
      created_at,
      id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageStoreModelCopyWith<_$_ImageStoreModel> get copyWith =>
      __$$_ImageStoreModelCopyWithImpl<_$_ImageStoreModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageStoreModelToJson(
      this,
    );
  }
}

abstract class _ImageStoreModel implements ImageStoreModel {
  const factory _ImageStoreModel(
      {final String? name,
      final int? category_id,
      final int? user_id,
      final String? description,
      final String? extention,
      final int? size,
      final User? user,
      final String? directory,
      final String? image_url,
      final String? filename,
      final String? code,
      final DateTime? updated_at,
      final DateTime? created_at,
      final int? id}) = _$_ImageStoreModel;

  factory _ImageStoreModel.fromJson(Map<String, dynamic> json) =
      _$_ImageStoreModel.fromJson;

  @override
  String? get name;
  @override
  int? get category_id;
  @override
  int? get user_id;
  @override
  String? get description;
  @override
  String? get extention;
  @override
  int? get size;
  @override
  User? get user;
  @override
  String? get directory;
  @override
  String? get image_url;
  @override
  String? get filename;
  @override
  String? get code;
  @override
  DateTime? get updated_at;
  @override
  DateTime? get created_at;
  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$_ImageStoreModelCopyWith<_$_ImageStoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}
