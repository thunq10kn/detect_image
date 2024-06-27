// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignedInImpl _$$SignedInImplFromJson(Map<String, dynamic> json) =>
    _$SignedInImpl(
      id: json['id'] as int,
      deactivated: json['deactivated'] as bool,
      username: json['username'] as String?,
      businessName: json['businessName'] as String?,
      companyName: json['companyName'] as String?,
      websiteUrl: json['websiteUrl'] as String?,
      licenseNumber: json['licenseNumber'] as String?,
      email: json['email'] as String?,
      planId: json['planId'] as int?,
      plansPublishByMonth: json['plansPublishByMonth'] as int?,
      status: json['status'] as int,
      firebaseUid: json['firebaseUid'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SignedInImplToJson(_$SignedInImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deactivated': instance.deactivated,
      'username': instance.username,
      'businessName': instance.businessName,
      'companyName': instance.companyName,
      'websiteUrl': instance.websiteUrl,
      'licenseNumber': instance.licenseNumber,
      'email': instance.email,
      'planId': instance.planId,
      'plansPublishByMonth': instance.plansPublishByMonth,
      'status': instance.status,
      'firebaseUid': instance.firebaseUid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'runtimeType': instance.$type,
    };

_$SignedOutImpl _$$SignedOutImplFromJson(Map<String, dynamic> json) =>
    _$SignedOutImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SignedOutImplToJson(_$SignedOutImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
