// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResultModel _$BaseResultModelFromJson(Map<String, dynamic> json) =>
    BaseResultModel(
      statusCode: json['status_code'] as int?,
      message: json['message'],
    );

Map<String, dynamic> _$BaseResultModelToJson(BaseResultModel instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
    };
