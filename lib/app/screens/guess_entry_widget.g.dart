// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guess_entry_widget.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GuessEntryState)
final guessEntryStateProvider = GuessEntryStateProvider._();

final class GuessEntryStateProvider
    extends $NotifierProvider<GuessEntryState, GuessEntryStateData> {
  GuessEntryStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'guessEntryStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$guessEntryStateHash();

  @$internal
  @override
  GuessEntryState create() => GuessEntryState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GuessEntryStateData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GuessEntryStateData>(value),
    );
  }
}

String _$guessEntryStateHash() => r'ab778206e48ab57ed031262dd9ef77a50a2f7a41';

abstract class _$GuessEntryState extends $Notifier<GuessEntryStateData> {
  GuessEntryStateData build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<GuessEntryStateData, GuessEntryStateData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GuessEntryStateData, GuessEntryStateData>,
              GuessEntryStateData,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
