// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vision_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VisionModel _$VisionModelFromJson(Map<String, dynamic> json) {
  return _VisionModel.fromJson(json);
}

/// @nodoc
mixin _$VisionModel {
  @JsonKey(name: 'textAnnotations')
  List<TextAnnotationsModel>? get textAnnotations =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisionModelCopyWith<VisionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisionModelCopyWith<$Res> {
  factory $VisionModelCopyWith(
          VisionModel value, $Res Function(VisionModel) then) =
      _$VisionModelCopyWithImpl<$Res, VisionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'textAnnotations')
      List<TextAnnotationsModel>? textAnnotations});
}

/// @nodoc
class _$VisionModelCopyWithImpl<$Res, $Val extends VisionModel>
    implements $VisionModelCopyWith<$Res> {
  _$VisionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textAnnotations = freezed,
  }) {
    return _then(_value.copyWith(
      textAnnotations: freezed == textAnnotations
          ? _value.textAnnotations
          : textAnnotations // ignore: cast_nullable_to_non_nullable
              as List<TextAnnotationsModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VisionModelImplCopyWith<$Res>
    implements $VisionModelCopyWith<$Res> {
  factory _$$VisionModelImplCopyWith(
          _$VisionModelImpl value, $Res Function(_$VisionModelImpl) then) =
      __$$VisionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'textAnnotations')
      List<TextAnnotationsModel>? textAnnotations});
}

/// @nodoc
class __$$VisionModelImplCopyWithImpl<$Res>
    extends _$VisionModelCopyWithImpl<$Res, _$VisionModelImpl>
    implements _$$VisionModelImplCopyWith<$Res> {
  __$$VisionModelImplCopyWithImpl(
      _$VisionModelImpl _value, $Res Function(_$VisionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textAnnotations = freezed,
  }) {
    return _then(_$VisionModelImpl(
      textAnnotations: freezed == textAnnotations
          ? _value._textAnnotations
          : textAnnotations // ignore: cast_nullable_to_non_nullable
              as List<TextAnnotationsModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VisionModelImpl implements _VisionModel {
  const _$VisionModelImpl(
      {@JsonKey(name: 'textAnnotations')
      final List<TextAnnotationsModel>? textAnnotations})
      : _textAnnotations = textAnnotations;

  factory _$VisionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisionModelImplFromJson(json);

  final List<TextAnnotationsModel>? _textAnnotations;
  @override
  @JsonKey(name: 'textAnnotations')
  List<TextAnnotationsModel>? get textAnnotations {
    final value = _textAnnotations;
    if (value == null) return null;
    if (_textAnnotations is EqualUnmodifiableListView) return _textAnnotations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'VisionModel(textAnnotations: $textAnnotations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisionModelImpl &&
            const DeepCollectionEquality()
                .equals(other._textAnnotations, _textAnnotations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_textAnnotations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VisionModelImplCopyWith<_$VisionModelImpl> get copyWith =>
      __$$VisionModelImplCopyWithImpl<_$VisionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisionModelImplToJson(
      this,
    );
  }
}

abstract class _VisionModel implements VisionModel {
  const factory _VisionModel(
      {@JsonKey(name: 'textAnnotations')
      final List<TextAnnotationsModel>? textAnnotations}) = _$VisionModelImpl;

  factory _VisionModel.fromJson(Map<String, dynamic> json) =
      _$VisionModelImpl.fromJson;

  @override
  @JsonKey(name: 'textAnnotations')
  List<TextAnnotationsModel>? get textAnnotations;
  @override
  @JsonKey(ignore: true)
  _$$VisionModelImplCopyWith<_$VisionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
