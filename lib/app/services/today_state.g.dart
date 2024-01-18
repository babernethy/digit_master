// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createPuzzleHash() => r'976693d7cd067ae93416e3dc176ed13fa0fa63a5';

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

/// See also [createPuzzle].
@ProviderFor(createPuzzle)
const createPuzzleProvider = CreatePuzzleFamily();

/// See also [createPuzzle].
class CreatePuzzleFamily extends Family<AsyncValue<CodePuzzle>> {
  /// See also [createPuzzle].
  const CreatePuzzleFamily();

  /// See also [createPuzzle].
  CreatePuzzleProvider call(
    List<int> code,
  ) {
    return CreatePuzzleProvider(
      code,
    );
  }

  @override
  CreatePuzzleProvider getProviderOverride(
    covariant CreatePuzzleProvider provider,
  ) {
    return call(
      provider.code,
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
  String? get name => r'createPuzzleProvider';
}

/// See also [createPuzzle].
class CreatePuzzleProvider extends AutoDisposeFutureProvider<CodePuzzle> {
  /// See also [createPuzzle].
  CreatePuzzleProvider(
    List<int> code,
  ) : this._internal(
          (ref) => createPuzzle(
            ref as CreatePuzzleRef,
            code,
          ),
          from: createPuzzleProvider,
          name: r'createPuzzleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createPuzzleHash,
          dependencies: CreatePuzzleFamily._dependencies,
          allTransitiveDependencies:
              CreatePuzzleFamily._allTransitiveDependencies,
          code: code,
        );

  CreatePuzzleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.code,
  }) : super.internal();

  final List<int> code;

  @override
  Override overrideWith(
    FutureOr<CodePuzzle> Function(CreatePuzzleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreatePuzzleProvider._internal(
        (ref) => create(ref as CreatePuzzleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        code: code,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CodePuzzle> createElement() {
    return _CreatePuzzleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreatePuzzleProvider && other.code == code;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, code.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreatePuzzleRef on AutoDisposeFutureProviderRef<CodePuzzle> {
  /// The parameter `code` of this provider.
  List<int> get code;
}

class _CreatePuzzleProviderElement
    extends AutoDisposeFutureProviderElement<CodePuzzle> with CreatePuzzleRef {
  _CreatePuzzleProviderElement(super.provider);

  @override
  List<int> get code => (origin as CreatePuzzleProvider).code;
}

String _$todayStateHash() => r'337c1d450bef9cc3f66d0931da1712c3987e5982';

/// See also [TodayState].
@ProviderFor(TodayState)
final todayStateProvider =
    AutoDisposeNotifierProvider<TodayState, TodayStateData>.internal(
  TodayState.new,
  name: r'todayStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todayStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodayState = AutoDisposeNotifier<TodayStateData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
