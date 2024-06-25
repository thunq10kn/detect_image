// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseResponseDataImpl _$$BaseResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$BaseResponseDataImpl(
      statusCode: json['statusCode'] as int? ?? 500,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? emptyMap
          : const BaseResponseDataConverter().fromJson(json['data']),
      error: json['error'] as String? ?? '',
    );

Map<String, dynamic> _$$BaseResponseDataImplToJson(
        _$BaseResponseDataImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': const BaseResponseDataConverter().toJson(instance.data),
      'error': instance.error,
    };
