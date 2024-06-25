import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rem_admin/src/screens/authentication/model/text_annotations_model.dart';

part 'vision_model.freezed.dart';
part 'vision_model.g.dart';
@freezed
class VisionModel with _$VisionModel {
  const factory VisionModel({
    @JsonKey(name: 'textAnnotations')
    List<TextAnnotationsModel>? textAnnotations,
  }) = _VisionModel;

  factory VisionModel.fromJson(Map<String, Object?> json) =>
      _$VisionModelFromJson(json);

}
