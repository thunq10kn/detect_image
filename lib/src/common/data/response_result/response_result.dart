import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rem_admin/src/common/data/base_response_data/base_response_data.dart';

part 'response_result.freezed.dart';

const serverConnectionFailure = 'サーバとの通信に失敗しました。';

@freezed
class ResponseResult with _$ResponseResult {
  /// success
  const factory ResponseResult.success({
    required BaseResponseData data,
  }) = Success;

  /// failure
  const factory ResponseResult.failure({
    @Default(serverConnectionFailure) String message,
  }) = Failure;
}
