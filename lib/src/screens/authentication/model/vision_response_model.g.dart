// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vision_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VisionResponseModelImpl _$$VisionResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VisionResponseModelImpl(
      responses: (json['responses'] as List<dynamic>?)
          ?.map((e) => VisionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VisionResponseModelImplToJson(
        _$VisionResponseModelImpl instance) =>
    <String, dynamic>{
      'responses': instance.responses,
    };
