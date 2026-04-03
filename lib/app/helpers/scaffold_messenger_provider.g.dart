// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scaffold_messenger_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(scaffoldMessengerKey)
final scaffoldMessengerKeyProvider = ScaffoldMessengerKeyProvider._();

final class ScaffoldMessengerKeyProvider
    extends
        $FunctionalProvider<
          GlobalKey<ScaffoldMessengerState>,
          GlobalKey<ScaffoldMessengerState>,
          GlobalKey<ScaffoldMessengerState>
        >
    with $Provider<GlobalKey<ScaffoldMessengerState>> {
  ScaffoldMessengerKeyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scaffoldMessengerKeyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scaffoldMessengerKeyHash();

  @$internal
  @override
  $ProviderElement<GlobalKey<ScaffoldMessengerState>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GlobalKey<ScaffoldMessengerState> create(Ref ref) {
    return scaffoldMessengerKey(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GlobalKey<ScaffoldMessengerState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GlobalKey<ScaffoldMessengerState>>(
        value,
      ),
    );
  }
}

String _$scaffoldMessengerKeyHash() =>
    r'a1bded3ff8d4a42a7c5e2ae7a7f744477c25872f';

@ProviderFor(scaffoldMessenger)
final scaffoldMessengerProvider = ScaffoldMessengerProvider._();

final class ScaffoldMessengerProvider
    extends
        $FunctionalProvider<
          ScaffoldMessengerState,
          ScaffoldMessengerState,
          ScaffoldMessengerState
        >
    with $Provider<ScaffoldMessengerState> {
  ScaffoldMessengerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scaffoldMessengerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scaffoldMessengerHash();

  @$internal
  @override
  $ProviderElement<ScaffoldMessengerState> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ScaffoldMessengerState create(Ref ref) {
    return scaffoldMessenger(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScaffoldMessengerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScaffoldMessengerState>(value),
    );
  }
}

String _$scaffoldMessengerHash() => r'e3521b1af1a19b037573334992010bc669072738';
