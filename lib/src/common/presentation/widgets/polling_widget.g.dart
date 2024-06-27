// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polling_widget.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pollingTimerControllerHash() =>
    r'3c249d9171e753bf48a1d7805eb5e8324ecdb94b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PollingTimerController
    extends BuildlessAutoDisposeNotifier<int> {
  late final PollingType type;

  int build(
    PollingType type,
  );
}

/// See also [PollingTimerController].
@ProviderFor(PollingTimerController)
const pollingTimerControllerProvider = PollingTimerControllerFamily();

/// See also [PollingTimerController].
class PollingTimerControllerFamily extends Family<int> {
  /// See also [PollingTimerController].
  const PollingTimerControllerFamily();

  /// See also [PollingTimerController].
  PollingTimerControllerProvider call(
    PollingType type,
  ) {
    return PollingTimerControllerProvider(
      type,
    );
  }

  @override
  PollingTimerControllerProvider getProviderOverride(
    covariant PollingTimerControllerProvider provider,
  ) {
    return call(
      provider.type,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pollingTimerControllerProvider';
}

/// See also [PollingTimerController].
class PollingTimerControllerProvider
    extends AutoDisposeNotifierProviderImpl<PollingTimerController, int> {
  /// See also [PollingTimerController].
  PollingTimerControllerProvider(
    PollingType type,
  ) : this._internal(
          () => PollingTimerController()..type = type,
          from: pollingTimerControllerProvider,
          name: r'pollingTimerControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pollingTimerControllerHash,
          dependencies: PollingTimerControllerFamily._dependencies,
          allTransitiveDependencies:
              PollingTimerControllerFamily._allTransitiveDependencies,
          type: type,
        );

  PollingTimerControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final PollingType type;

  @override
  int runNotifierBuild(
    covariant PollingTimerController notifier,
  ) {
    return notifier.build(
      type,
    );
  }

  @override
  Override overrideWith(PollingTimerController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PollingTimerControllerProvider._internal(
        () => create()..type = type,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PollingTimerController, int>
      createElement() {
    return _PollingTimerControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PollingTimerControllerProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PollingTimerControllerRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `type` of this provider.
  PollingType get type;
}

class _PollingTimerControllerProviderElement
    extends AutoDisposeNotifierProviderElement<PollingTimerController, int>
    with PollingTimerControllerRef {
  _PollingTimerControllerProviderElement(super.provider);

  @override
  PollingType get type => (origin as PollingTimerControllerProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
