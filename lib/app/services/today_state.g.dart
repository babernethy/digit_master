// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(createPuzzle)
final createPuzzleProvider = CreatePuzzleFamily._();

final class CreatePuzzleProvider
    extends
        $FunctionalProvider<
          AsyncValue<CodePuzzle>,
          CodePuzzle,
          FutureOr<CodePuzzle>
        >
    with $FutureModifier<CodePuzzle>, $FutureProvider<CodePuzzle> {
  CreatePuzzleProvider._({
    required CreatePuzzleFamily super.from,
    required List<int> super.argument,
  }) : super(
         retry: null,
         name: r'createPuzzleProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$createPuzzleHash();

  @override
  String toString() {
    return r'createPuzzleProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<CodePuzzle> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<CodePuzzle> create(Ref ref) {
    final argument = this.argument as List<int>;
    return createPuzzle(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CreatePuzzleProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$createPuzzleHash() => r'66e3cb6305b13159b36d77cd0b464a3199a54abb';

final class CreatePuzzleFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<CodePuzzle>, List<int>> {
  CreatePuzzleFamily._()
    : super(
        retry: null,
        name: r'createPuzzleProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CreatePuzzleProvider call(List<int> code) =>
      CreatePuzzleProvider._(argument: code, from: this);

  @override
  String toString() => r'createPuzzleProvider';
}

@ProviderFor(TodayState)
final todayStateProvider = TodayStateProvider._();

final class TodayStateProvider
    extends $NotifierProvider<TodayState, TodayStateData> {
  TodayStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todayStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todayStateHash();

  @$internal
  @override
  TodayState create() => TodayState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TodayStateData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TodayStateData>(value),
    );
  }
}

String _$todayStateHash() => r'337c1d450bef9cc3f66d0931da1712c3987e5982';

abstract class _$TodayState extends $Notifier<TodayStateData> {
  TodayStateData build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<TodayStateData, TodayStateData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TodayStateData, TodayStateData>,
              TodayStateData,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
