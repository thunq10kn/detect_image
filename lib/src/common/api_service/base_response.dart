import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@freezed
class BaseResponse with _$BaseResponse {
  const factory BaseResponse({
    required dynamic data,
    required int statusCode,
    required String message,
  }) = _BaseResponse;

  const BaseResponse._();

  factory BaseResponse.fromJson(Map<String, Object?> json) =>
      _$BaseResponseFromJson(json);
}

@freezed
class PaginationModel with _$PaginationModel {
  const factory PaginationModel({
    required int count,
    required int currentPage,
    required bool hasMore,
    required int totalPage,
  }) = _PaginationModel;

  const PaginationModel._();

  factory PaginationModel.fromJson(Map<String, Object?> json) =>
      _$PaginationModelFromJson(json);
}
