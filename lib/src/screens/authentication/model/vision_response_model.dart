import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rem_admin/src/screens/authentication/model/text_annotations_model.dart';
import 'package:rem_admin/src/screens/authentication/model/vision_model.dart';

part 'vision_response_model.freezed.dart';
part 'vision_response_model.g.dart';
@freezed
class VisionResponseModel with _$VisionResponseModel {
  const factory VisionResponseModel({
    @JsonKey(name: 'responses')
    List<VisionModel>? responses,
  }) = _VisionResponseModel;

  factory VisionResponseModel.fromJson(Map<String, Object?> json) =>
      _$VisionResponseModelFromJson(json);

}
