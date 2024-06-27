// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeControllerHash() => r'c634d62c01da41fc6e6bd187296da83903d28e3d';

/// Provider to send an verification code via SMS to a specified phone number.
/// Provider to sign in with email and password.
/// If the user is not registered, register the user.
/// If the user is registered, sign in.
///
/// Copied from [HomeController].
@ProviderFor(HomeController)
final homeControllerProvider =
    AutoDisposeAsyncNotifierProvider<HomeController, void>.internal(
  HomeController.new,
  name: r'homeControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
