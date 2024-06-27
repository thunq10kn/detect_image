// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUserModel _$AppUserModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'signedIn':
      return SignedIn.fromJson(json);
    case 'signedOut':
      return SignedOut.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AppUserModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AppUserModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            bool deactivated,
            String? username,
            String? businessName,
            String? companyName,
            String? websiteUrl,
            String? licenseNumber,
            String? email,
            int? planId,
            int? plansPublishByMonth,
            int status,
            String firebaseUid,
            String createdAt,
            String updatedAt)
        signedIn,
    required TResult Function() signedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            bool deactivated,
            String? username,
            String? businessName,
            String? companyName,
            String? websiteUrl,
            String? licenseNumber,
            String? email,
            int? planId,
            int? plansPublishByMonth,
            int status,
            String firebaseUid,
            String createdAt,
            String updatedAt)?
        signedIn,
    TResult? Function()? signedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            bool deactivated,
            String? username,
            String? businessName,
            String? companyName,
            String? websiteUrl,
            String? licenseNumber,
            String? email,
            int? planId,
            int? plansPublishByMonth,
            int status,
            String firebaseUid,
            String createdAt,
            String updatedAt)?
        signedIn,
    TResult Function()? signedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignedIn value) signedIn,
    required TResult Function(SignedOut value) signedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignedIn value)? signedIn,
    TResult? Function(SignedOut value)? signedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignedIn value)? signedIn,
    TResult Function(SignedOut value)? signedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserModelCopyWith<$Res> {
  factory $AppUserModelCopyWith(
          AppUserModel value, $Res Function(AppUserModel) then) =
      _$AppUserModelCopyWithImpl<$Res, AppUserModel>;
}

/// @nodoc
class _$AppUserModelCopyWithImpl<$Res, $Val extends AppUserModel>
    implements $AppUserModelCopyWith<$Res> {
  _$AppUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SignedInImplCopyWith<$Res> {
  factory _$$SignedInImplCopyWith(
          _$SignedInImpl value, $Res Function(_$SignedInImpl) then) =
      __$$SignedInImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int id,
      bool deactivated,
      String? username,
      String? businessName,
      String? companyName,
      String? websiteUrl,
      String? licenseNumber,
      String? email,
      int? planId,
      int? plansPublishByMonth,
      int status,
      String firebaseUid,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$SignedInImplCopyWithImpl<$Res>
    extends _$AppUserModelCopyWithImpl<$Res, _$SignedInImpl>
    implements _$$SignedInImplCopyWith<$Res> {
  __$$SignedInImplCopyWithImpl(
      _$SignedInImpl _value, $Res Function(_$SignedInImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deactivated = null,
    Object? username = freezed,
    Object? businessName = freezed,
    Object? companyName = freezed,
    Object? websiteUrl = freezed,
    Object? licenseNumber = freezed,
    Object? email = freezed,
    Object? planId = freezed,
    Object? plansPublishByMonth = freezed,
    Object? status = null,
    Object? firebaseUid = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$SignedInImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      deactivated: null == deactivated
          ? _value.deactivated
          : deactivated // ignore: cast_nullable_to_non_nullable
              as bool,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: freezed == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: freezed == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      planId: freezed == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int?,
      plansPublishByMonth: freezed == plansPublishByMonth
          ? _value.plansPublishByMonth
          : plansPublishByMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      firebaseUid: null == firebaseUid
          ? _value.firebaseUid
          : firebaseUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignedInImpl extends SignedIn {
  const _$SignedInImpl(
      {required this.id,
      required this.deactivated,
      this.username,
      this.businessName,
      this.companyName,
      this.websiteUrl,
      this.licenseNumber,
      this.email,
      required this.planId,
      required this.plansPublishByMonth,
      required this.status,
      required this.firebaseUid,
      required this.createdAt,
      required this.updatedAt,
      final String? $type})
      : $type = $type ?? 'signedIn',
        super._();

  factory _$SignedInImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignedInImplFromJson(json);

  @override
  final int id;
  @override
  final bool deactivated;
  @override
  final String? username;
  @override
  final String? businessName;
  @override
  final String? companyName;
  @override
  final String? websiteUrl;
  @override
  final String? licenseNumber;
  @override
  final String? email;
  @override
  final int? planId;
  @override
  final int? plansPublishByMonth;
  @override
  final int status;
  @override
  final String firebaseUid;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppUserModel.signedIn(id: $id, deactivated: $deactivated, username: $username, businessName: $businessName, companyName: $companyName, websiteUrl: $websiteUrl, licenseNumber: $licenseNumber, email: $email, planId: $planId, plansPublishByMonth: $plansPublishByMonth, status: $status, firebaseUid: $firebaseUid, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignedInImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deactivated, deactivated) ||
                other.deactivated == deactivated) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.websiteUrl, websiteUrl) ||
                other.websiteUrl == websiteUrl) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.plansPublishByMonth, plansPublishByMonth) ||
                other.plansPublishByMonth == plansPublishByMonth) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.firebaseUid, firebaseUid) ||
                other.firebaseUid == firebaseUid) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      deactivated,
      username,
      businessName,
      companyName,
      websiteUrl,
      licenseNumber,
      email,
      planId,
      plansPublishByMonth,
      status,
      firebaseUid,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignedInImplCopyWith<_$SignedInImpl> get copyWith =>
      __$$SignedInImplCopyWithImpl<_$SignedInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            bool deactivated,
            String? username,
            String? businessName,
            String? companyName,
            String? websiteUrl,
            String? licenseNumber,
            String? email,
            int? planId,
            int? plansPublishByMonth,
            int status,
            String firebaseUid,
            String createdAt,
            String updatedAt)
        signedIn,
    required TResult Function() signedOut,
  }) {
    return signedIn(
        id,
        deactivated,
        username,
        businessName,
        companyName,
        websiteUrl,
        licenseNumber,
        email,
        planId,
        plansPublishByMonth,
        status,
        firebaseUid,
        createdAt,
        updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            bool deactivated,
            String? username,
            String? businessName,
            String? companyName,
            String? websiteUrl,
            String? licenseNumber,
            String? email,
            int? planId,
            int? plansPublishByMonth,
            int status,
            String firebaseUid,
            String createdAt,
            String updatedAt)?
        signedIn,
    TResult? Function()? signedOut,
  }) {
    return signedIn?.call(
        id,
        deactivated,
        username,
        businessName,
        companyName,
        websiteUrl,
        licenseNumber,
        email,
        planId,
        plansPublishByMonth,
        status,
        firebaseUid,
        createdAt,
        updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            bool deactivated,
            String? username,
            String? businessName,
            String? companyName,
            String? websiteUrl,
            String? licenseNumber,
            String? email,
            int? planId,
            int? plansPublishByMonth,
            int status,
            String firebaseUid,
            String createdAt,
            String updatedAt)?
        signedIn,
    TResult Function()? signedOut,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn(
          id,
          deactivated,
          username,
          businessName,
          companyName,
          websiteUrl,
          licenseNumber,
          email,
          planId,
          plansPublishByMonth,
          status,
          firebaseUid,
          createdAt,
          updatedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignedIn value) signedIn,
    required TResult Function(SignedOut value) signedOut,
  }) {
    return signedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignedIn value)? signedIn,
    TResult? Function(SignedOut value)? signedOut,
  }) {
    return signedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignedIn value)? signedIn,
    TResult Function(SignedOut value)? signedOut,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SignedInImplToJson(
      this,
    );
  }
}

abstract class SignedIn extends AppUserModel {
  const factory SignedIn(
      {required final int id,
      required final bool deactivated,
      final String? username,
      final String? businessName,
      final String? companyName,
      final String? websiteUrl,
      final String? licenseNumber,
      final String? email,
      required final int? planId,
      required final int? plansPublishByMonth,
      required final int status,
      required final String firebaseUid,
      required final String createdAt,
      required final String updatedAt}) = _$SignedInImpl;
  const SignedIn._() : super._();

  factory SignedIn.fromJson(Map<String, dynamic> json) =
      _$SignedInImpl.fromJson;

  int get id;
  bool get deactivated;
  String? get username;
  String? get businessName;
  String? get companyName;
  String? get websiteUrl;
  String? get licenseNumber;
  String? get email;
  int? get planId;
  int? get plansPublishByMonth;
  int get status;
  String get firebaseUid;
  String get createdAt;
  String get updatedAt;
  @JsonKey(ignore: true)
  _$$SignedInImplCopyWith<_$SignedInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignedOutImplCopyWith<$Res> {
  factory _$$SignedOutImplCopyWith(
          _$SignedOutImpl value, $Res Function(_$SignedOutImpl) then) =
      __$$SignedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignedOutImplCopyWithImpl<$Res>
    extends _$AppUserModelCopyWithImpl<$Res, _$SignedOutImpl>
    implements _$$SignedOutImplCopyWith<$Res> {
  __$$SignedOutImplCopyWithImpl(
      _$SignedOutImpl _value, $Res Function(_$SignedOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$SignedOutImpl extends SignedOut {
  const _$SignedOutImpl({final String? $type})
      : $type = $type ?? 'signedOut',
        super._();

  factory _$SignedOutImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignedOutImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppUserModel.signedOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignedOutImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            bool deactivated,
            String? username,
            String? businessName,
            String? companyName,
            String? websiteUrl,
            String? licenseNumber,
            String? email,
            int? planId,
            int? plansPublishByMonth,
            int status,
            String firebaseUid,
            String createdAt,
            String updatedAt)
        signedIn,
    required TResult Function() signedOut,
  }) {
    return signedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            bool deactivated,
            String? username,
            String? businessName,
            String? companyName,
            String? websiteUrl,
            String? licenseNumber,
            String? email,
            int? planId,
            int? plansPublishByMonth,
            int status,
            String firebaseUid,
            String createdAt,
            String updatedAt)?
        signedIn,
    TResult? Function()? signedOut,
  }) {
    return signedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            bool deactivated,
            String? username,
            String? businessName,
            String? companyName,
            String? websiteUrl,
            String? licenseNumber,
            String? email,
            int? planId,
            int? plansPublishByMonth,
            int status,
            String firebaseUid,
            String createdAt,
            String updatedAt)?
        signedIn,
    TResult Function()? signedOut,
    required TResult orElse(),
  }) {
    if (signedOut != null) {
      return signedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignedIn value) signedIn,
    required TResult Function(SignedOut value) signedOut,
  }) {
    return signedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignedIn value)? signedIn,
    TResult? Function(SignedOut value)? signedOut,
  }) {
    return signedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignedIn value)? signedIn,
    TResult Function(SignedOut value)? signedOut,
    required TResult orElse(),
  }) {
    if (signedOut != null) {
      return signedOut(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SignedOutImplToJson(
      this,
    );
  }
}

abstract class SignedOut extends AppUserModel {
  const factory SignedOut() = _$SignedOutImpl;
  const SignedOut._() : super._();

  factory SignedOut.fromJson(Map<String, dynamic> json) =
      _$SignedOutImpl.fromJson;
}
