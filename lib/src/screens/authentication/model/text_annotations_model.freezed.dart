// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_annotations_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TextAnnotationsModel _$TextAnnotationsModelFromJson(Map<String, dynamic> json) {
  return _TextAnnotationsModel.fromJson(json);
}

/// @nodoc
mixin _$TextAnnotationsModel {
  @JsonKey(name: 'locale')
  String? get locale => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TextAnnotationsModelCopyWith<TextAnnotationsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextAnnotationsModelCopyWith<$Res> {
  factory $TextAnnotationsModelCopyWith(TextAnnotationsModel value,
          $Res Function(TextAnnotationsModel) then) =
      _$TextAnnotationsModelCopyWithImpl<$Res, TextAnnotationsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'locale') String? locale,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class _$TextAnnotationsModelCopyWithImpl<$Res,
        $Val extends TextAnnotationsModel>
    implements $TextAnnotationsModelCopyWith<$Res> {
  _$TextAnnotationsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextAnnotationsModelImplCopyWith<$Res>
    implements $TextAnnotationsModelCopyWith<$Res> {
  factory _$$TextAnnotationsModelImplCopyWith(_$TextAnnotationsModelImpl value,
          $Res Function(_$TextAnnotationsModelImpl) then) =
      __$$TextAnnotationsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'locale') String? locale,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class __$$TextAnnotationsModelImplCopyWithImpl<$Res>
    extends _$TextAnnotationsModelCopyWithImpl<$Res, _$TextAnnotationsModelImpl>
    implements _$$TextAnnotationsModelImplCopyWith<$Res> {
  __$$TextAnnotationsModelImplCopyWithImpl(_$TextAnnotationsModelImpl _value,
      $Res Function(_$TextAnnotationsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? description = freezed,
  }) {
    return _then(_$TextAnnotationsModelImpl(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextAnnotationsModelImpl implements _TextAnnotationsModel {
  const _$TextAnnotationsModelImpl(
      {@JsonKey(name: 'locale') this.locale,
      @JsonKey(name: 'description') this.description});

  factory _$TextAnnotationsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextAnnotationsModelImplFromJson(json);

  @override
  @JsonKey(name: 'locale')
  final String? locale;
  @override
  @JsonKey(name: 'description')
  final String? description;

  @override
  String toString() {
    return 'TextAnnotationsModel(locale: $locale, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextAnnotationsModelImpl &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, locale, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextAnnotationsModelImplCopyWith<_$TextAnnotationsModelImpl>
      get copyWith =>
          __$$TextAnnotationsModelImplCopyWithImpl<_$TextAnnotationsModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextAnnotationsModelImplToJson(
      this,
    );
  }
}

abstract class _TextAnnotationsModel implements TextAnnotationsModel {
  const factory _TextAnnotationsModel(
          {@JsonKey(name: 'locale') final String? locale,
          @JsonKey(name: 'description') final String? description}) =
      _$TextAnnotationsModelImpl;

  factory _TextAnnotationsModel.fromJson(Map<String, dynamic> json) =
      _$TextAnnotationsModelImpl.fromJson;

  @override
  @JsonKey(name: 'locale')
  String? get locale;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$TextAnnotationsModelImplCopyWith<_$TextAnnotationsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
