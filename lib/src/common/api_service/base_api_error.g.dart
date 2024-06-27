// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseApiError _$BaseApiErrorFromJson(Map<String, dynamic> json) => BaseApiError(
      statusCode: json['statusCode'] as int?,
      message: json['message'],
      error: json['error'] as String?,
    );

Map<String, dynamic> _$BaseApiErrorToJson(BaseApiError instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'error': instance.error,
    };
