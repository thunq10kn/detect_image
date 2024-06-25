import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user_model.freezed.dart';
part 'app_user_model.g.dart';

@freezed
class AppUserModel with _$AppUserModel {
  const factory AppUserModel.signedIn({
    required int id,
    required bool deactivated,
    String? username,
    String? businessName,
    String? companyName,
    String? websiteUrl,
    String? licenseNumber,
    String? email,
    required int? planId,
    required int? plansPublishByMonth,
    required int status,
    required String firebaseUid,
    required String createdAt,
    required String updatedAt,
  }) = SignedIn;

  const factory AppUserModel.signedOut() = SignedOut;

  factory AppUserModel.fromJson(Map<String, Object?> json) => _$AppUserModelFromJson(json);

  const AppUserModel._();
  int? get userId => mapOrNull<int>(
        signedIn: (value) {
          return value.id;
        },
        signedOut: (value) {
          return null;
        },
      );

  String? get companyName => mapOrNull<String>(
        signedIn: (value) {
          return value.companyName;
        },
        signedOut: (value) {
          return null;
        },
      );

  String? get email => mapOrNull<String>(
    signedIn: (value) {
      return value.email;
    },
    signedOut: (value) {
      return null;
    },
  );

  String? get businessName => mapOrNull<String>(
    signedIn: (value) {
      return value.businessName;
    },
    signedOut: (value) {
      return null;
    },
  );


  String? get userName => mapOrNull<String>(
    signedIn: (value) {
      return value.username;
    },
    signedOut: (value) {
      return null;
    },
  );

  int? get planId => mapOrNull<int?>(
        signedIn: (value) {
          return value.planId;
        },
        signedOut: (value) {
          return null;
        },
      );

  int? get plansPublishByMonth => mapOrNull<int?>(
        signedIn: (value) {
          return value.plansPublishByMonth;
        },
        signedOut: (value) {
          return null;
        },
      );


}
