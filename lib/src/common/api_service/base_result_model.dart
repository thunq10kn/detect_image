import 'package:json_annotation/json_annotation.dart';

part 'base_result_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BaseResultModel {
  BaseResultModel({
    this.statusCode,
    this.message,
  }) {
    //Check session expried
    if (statusCode == 403) {}
  }

  factory BaseResultModel.fromJson(Map<String, dynamic> json) =>
      _$BaseResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResultModelToJson(this);

  int? statusCode;
  dynamic message;

  bool isSuccess() =>
      statusCode == null ? false : (200 <= statusCode! && 300 > statusCode!);
}
