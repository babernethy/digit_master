// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guess_entry_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GuessEntryStateData {
  List<int> get guess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GuessEntryStateDataCopyWith<GuessEntryStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuessEntryStateDataCopyWith<$Res> {
  factory $GuessEntryStateDataCopyWith(
          GuessEntryStateData value, $Res Function(GuessEntryStateData) then) =
      _$GuessEntryStateDataCopyWithImpl<$Res, GuessEntryStateData>;
  @useResult
  $Res call({List<int> guess});
}

/// @nodoc
class _$GuessEntryStateDataCopyWithImpl<$Res, $Val extends GuessEntryStateData>
    implements $GuessEntryStateDataCopyWith<$Res> {
  _$GuessEntryStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guess = null,
  }) {
    return _then(_value.copyWith(
      guess: null == guess
          ? _value.guess
          : guess // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuessEntryStateDataImplCopyWith<$Res>
    implements $GuessEntryStateDataCopyWith<$Res> {
  factory _$$GuessEntryStateDataImplCopyWith(_$GuessEntryStateDataImpl value,
          $Res Function(_$GuessEntryStateDataImpl) then) =
      __$$GuessEntryStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> guess});
}

/// @nodoc
class __$$GuessEntryStateDataImplCopyWithImpl<$Res>
    extends _$GuessEntryStateDataCopyWithImpl<$Res, _$GuessEntryStateDataImpl>
    implements _$$GuessEntryStateDataImplCopyWith<$Res> {
  __$$GuessEntryStateDataImplCopyWithImpl(_$GuessEntryStateDataImpl _value,
      $Res Function(_$GuessEntryStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guess = null,
  }) {
    return _then(_$GuessEntryStateDataImpl(
      guess: null == guess
          ? _value._guess
          : guess // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$GuessEntryStateDataImpl implements _GuessEntryStateData {
  _$GuessEntryStateDataImpl({final List<int> guess = const []})
      : _guess = guess;

  final List<int> _guess;
  @override
  @JsonKey()
  List<int> get guess {
    if (_guess is EqualUnmodifiableListView) return _guess;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guess);
  }

  @override
  String toString() {
    return 'GuessEntryStateData(guess: $guess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuessEntryStateDataImpl &&
            const DeepCollectionEquality().equals(other._guess, _guess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_guess));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GuessEntryStateDataImplCopyWith<_$GuessEntryStateDataImpl> get copyWith =>
      __$$GuessEntryStateDataImplCopyWithImpl<_$GuessEntryStateDataImpl>(
          this, _$identity);
}

abstract class _GuessEntryStateData implements GuessEntryStateData {
  factory _GuessEntryStateData({final List<int> guess}) =
      _$GuessEntryStateDataImpl;

  @override
  List<int> get guess;
  @override
  @JsonKey(ignore: true)
  _$$GuessEntryStateDataImplCopyWith<_$GuessEntryStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
