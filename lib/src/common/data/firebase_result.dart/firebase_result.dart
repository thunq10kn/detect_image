import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_result.freezed.dart';

@freezed
class FirebaseResult<T> with _$FirebaseResult<T> {
  /// success
  const factory FirebaseResult.success({
    required T contents,
    String? message,
  }) = Success<T>;

  /// failure
  const factory FirebaseResult.failure({
    required String message,
    String? code,
  }) = Failure<T>;
}
