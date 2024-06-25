// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vision_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VisionResponseModel _$VisionResponseModelFromJson(Map<String, dynamic> json) {
  return _VisionResponseModel.fromJson(json);
}

/// @nodoc
mixin _$VisionResponseModel {
  @JsonKey(name: 'responses')
  List<VisionModel>? get responses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisionResponseModelCopyWith<VisionResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisionResponseModelCopyWith<$Res> {
  factory $VisionResponseModelCopyWith(
          VisionResponseModel value, $Res Function(VisionResponseModel) then) =
      _$VisionResponseModelCopyWithImpl<$Res, VisionResponseModel>;
  @useResult
  $Res call({@JsonKey(name: 'responses') List<VisionModel>? responses});
}

/// @nodoc
class _$VisionResponseModelCopyWithImpl<$Res, $Val extends VisionResponseModel>
    implements $VisionResponseModelCopyWith<$Res> {
  _$VisionResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responses = freezed,
  }) {
    return _then(_value.copyWith(
      responses: freezed == responses
          ? _value.responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<VisionModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VisionResponseModelImplCopyWith<$Res>
    implements $VisionResponseModelCopyWith<$Res> {
  factory _$$VisionResponseModelImplCopyWith(_$VisionResponseModelImpl value,
          $Res Function(_$VisionResponseModelImpl) then) =
      __$$VisionResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'responses') List<VisionModel>? responses});
}

/// @nodoc
class __$$VisionResponseModelImplCopyWithImpl<$Res>
    extends _$VisionResponseModelCopyWithImpl<$Res, _$VisionResponseModelImpl>
    implements _$$VisionResponseModelImplCopyWith<$Res> {
  __$$VisionResponseModelImplCopyWithImpl(_$VisionResponseModelImpl _value,
      $Res Function(_$VisionResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responses = freezed,
  }) {
    return _then(_$VisionResponseModelImpl(
      responses: freezed == responses
          ? _value._responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<VisionModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VisionResponseModelImpl implements _VisionResponseModel {
  const _$VisionResponseModelImpl(
      {@JsonKey(name: 'responses') final List<VisionModel>? responses})
      : _responses = responses;

  factory _$VisionResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisionResponseModelImplFromJson(json);

  final List<VisionModel>? _responses;
  @override
  @JsonKey(name: 'responses')
  List<VisionModel>? get responses {
    final value = _responses;
    if (value == null) return null;
    if (_responses is EqualUnmodifiableListView) return _responses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'VisionResponseModel(responses: $responses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisionResponseModelImpl &&
            const DeepCollectionEquality()
                .equals(other._responses, _responses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_responses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VisionResponseModelImplCopyWith<_$VisionResponseModelImpl> get copyWith =>
      __$$VisionResponseModelImplCopyWithImpl<_$VisionResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisionResponseModelImplToJson(
      this,
    );
  }
}

abstract class _VisionResponseModel implements VisionResponseModel {
  const factory _VisionResponseModel(
          {@JsonKey(name: 'responses') final List<VisionModel>? responses}) =
      _$VisionResponseModelImpl;

  factory _VisionResponseModel.fromJson(Map<String, dynamic> json) =
      _$VisionResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'responses')
  List<VisionModel>? get responses;
  @override
  @JsonKey(ignore: true)
  _$$VisionResponseModelImplCopyWith<_$VisionResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
