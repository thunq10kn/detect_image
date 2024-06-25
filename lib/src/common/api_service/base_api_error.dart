import 'package:json_annotation/json_annotation.dart';

part 'base_api_error.g.dart';

@JsonSerializable()
class BaseApiError{
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "message")
  final dynamic message;
  @JsonKey(name: "error")
  final String? error;

  BaseApiError({this.statusCode,this.message,this.error});

  factory BaseApiError.fromJson(Map<String, dynamic> json) =>
      _$BaseApiErrorFromJson(json);

  Map<String, dynamic> toJson() => _$BaseApiErrorToJson(this);
}