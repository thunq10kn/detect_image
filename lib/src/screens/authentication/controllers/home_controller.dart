import 'dart:typed_data';

import 'package:rem_admin/src/common/presentation/widgets/dialogs.dart';
import 'package:rem_admin/src/screens/authentication/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/vision_response_model.dart';

part 'home_controller.g.dart';

/// Provider to send an verification code via SMS to a specified phone number.

/// Provider to sign in with email and password.
/// If the user is not registered, register the user.
/// If the user is registered, sign in.
@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<void> build() {
    return null;
  }

  /// Sign in with email and password.
  /// If the user is not registered, register the user.
  /// If the user is registered, sign in.
  Future<void> fetchDataVisionAI(Uint8List? imageData,String accessToken,{Function? callBack}) async {
    try{
      final response = await ref.read(homeRepositoryProvider).fetchDataVisionAI(imageData,accessToken);
      callBack?.call(response);
    }catch(e){
      print('EROOROROROR = ${e.toString()}');
    }
  }
}
