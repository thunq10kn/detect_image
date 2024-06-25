import 'package:freezed_annotation/freezed_annotation.dart';

import 'base_response_data/base_response_data.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    required int count,
    required int currentPage,
    required int totalPage,
    required bool hasMore,
    bool? hasTmpProperty,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, Object?> json) =>
      _$PaginationFromJson(json);

  factory Pagination.fromBaseResponseData(BaseResponseData baseResponseData) =>
      Pagination.fromJson(baseResponseData.data);
}
