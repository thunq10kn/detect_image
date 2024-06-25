// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vision_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VisionModelImpl _$$VisionModelImplFromJson(Map<String, dynamic> json) =>
    _$VisionModelImpl(
      textAnnotations: (json['textAnnotations'] as List<dynamic>?)
          ?.map((e) => TextAnnotationsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VisionModelImplToJson(_$VisionModelImpl instance) =>
    <String, dynamic>{
      'textAnnotations': instance.textAnnotations,
    };
