import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_annotations_model.freezed.dart';
part 'text_annotations_model.g.dart';

@freezed
class TextAnnotationsModel with _$TextAnnotationsModel {
  const factory TextAnnotationsModel({
    @JsonKey(name: 'locale')
    String? locale,
    @JsonKey(name: 'description')
    String? description,
  }) = _TextAnnotationsModel;

  factory TextAnnotationsModel.fromJson(Map<String, Object?> json) =>
      _$TextAnnotationsModelFromJson(json);

}
