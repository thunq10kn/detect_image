// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BaseResponseData _$BaseResponseDataFromJson(Map<String, dynamic> json) {
  return _BaseResponseData.fromJson(json);
}

/// @nodoc
mixin _$BaseResponseData {
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @BaseResponseDataConverter()
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseResponseDataCopyWith<BaseResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseResponseDataCopyWith<$Res> {
  factory $BaseResponseDataCopyWith(
          BaseResponseData value, $Res Function(BaseResponseData) then) =
      _$BaseResponseDataCopyWithImpl<$Res, BaseResponseData>;
  @useResult
  $Res call(
      {int statusCode,
      String message,
      @BaseResponseDataConverter() Map<String, dynamic> data,
      String error});
}

/// @nodoc
class _$BaseResponseDataCopyWithImpl<$Res, $Val extends BaseResponseData>
    implements $BaseResponseDataCopyWith<$Res> {
  _$BaseResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseResponseDataImplCopyWith<$Res>
    implements $BaseResponseDataCopyWith<$Res> {
  factory _$$BaseResponseDataImplCopyWith(_$BaseResponseDataImpl value,
          $Res Function(_$BaseResponseDataImpl) then) =
      __$$BaseResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int statusCode,
      String message,
      @BaseResponseDataConverter() Map<String, dynamic> data,
      String error});
}

/// @nodoc
class __$$BaseResponseDataImplCopyWithImpl<$Res>
    extends _$BaseResponseDataCopyWithImpl<$Res, _$BaseResponseDataImpl>
    implements _$$BaseResponseDataImplCopyWith<$Res> {
  __$$BaseResponseDataImplCopyWithImpl(_$BaseResponseDataImpl _value,
      $Res Function(_$BaseResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
    Object? error = null,
  }) {
    return _then(_$BaseResponseDataImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BaseResponseDataImpl implements _BaseResponseData {
  const _$BaseResponseDataImpl(
      {this.statusCode = 500,
      this.message = '',
      @BaseResponseDataConverter() final Map<String, dynamic> data = emptyMap,
      this.error = ''})
      : _data = data;

  factory _$BaseResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaseResponseDataImplFromJson(json);

  @override
  @JsonKey()
  final int statusCode;
  @override
  @JsonKey()
  final String message;
  final Map<String, dynamic> _data;
  @override
  @JsonKey()
  @BaseResponseDataConverter()
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'BaseResponseData(statusCode: $statusCode, message: $message, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseResponseDataImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message,
      const DeepCollectionEquality().hash(_data), error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseResponseDataImplCopyWith<_$BaseResponseDataImpl> get copyWith =>
      __$$BaseResponseDataImplCopyWithImpl<_$BaseResponseDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BaseResponseDataImplToJson(
      this,
    );
  }
}

abstract class _BaseResponseData implements BaseResponseData {
  const factory _BaseResponseData(
      {final int statusCode,
      final String message,
      @BaseResponseDataConverter() final Map<String, dynamic> data,
      final String error}) = _$BaseResponseDataImpl;

  factory _BaseResponseData.fromJson(Map<String, dynamic> json) =
      _$BaseResponseDataImpl.fromJson;

  @override
  int get statusCode;
  @override
  String get message;
  @override
  @BaseResponseDataConverter()
  Map<String, dynamic> get data;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$BaseResponseDataImplCopyWith<_$BaseResponseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
