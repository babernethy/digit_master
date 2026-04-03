// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getLocalization)
final getLocalizationProvider = GetLocalizationProvider._();

final class GetLocalizationProvider
    extends $FunctionalProvider<Localization, Localization, Localization>
    with $Provider<Localization> {
  GetLocalizationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getLocalizationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getLocalizationHash();

  @$internal
  @override
  $ProviderElement<Localization> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Localization create(Ref ref) {
    return getLocalization(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Localization value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Localization>(value),
    );
  }
}

String _$getLocalizationHash() => r'02510a400b31403d10d7e8d5f7d8d7e801de9f43';
