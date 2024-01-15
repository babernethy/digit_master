// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'code_puzzle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CodePuzzle {
  List<int> get code => throw _privateConstructorUsedError;
  List<List<int>> get hints => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CodePuzzleCopyWith<CodePuzzle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CodePuzzleCopyWith<$Res> {
  factory $CodePuzzleCopyWith(
          CodePuzzle value, $Res Function(CodePuzzle) then) =
      _$CodePuzzleCopyWithImpl<$Res, CodePuzzle>;
  @useResult
  $Res call({List<int> code, List<List<int>> hints});
}

/// @nodoc
class _$CodePuzzleCopyWithImpl<$Res, $Val extends CodePuzzle>
    implements $CodePuzzleCopyWith<$Res> {
  _$CodePuzzleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? hints = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as List<int>,
      hints: null == hints
          ? _value.hints
          : hints // ignore: cast_nullable_to_non_nullable
              as List<List<int>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CodePuzzleImplCopyWith<$Res>
    implements $CodePuzzleCopyWith<$Res> {
  factory _$$CodePuzzleImplCopyWith(
          _$CodePuzzleImpl value, $Res Function(_$CodePuzzleImpl) then) =
      __$$CodePuzzleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> code, List<List<int>> hints});
}

/// @nodoc
class __$$CodePuzzleImplCopyWithImpl<$Res>
    extends _$CodePuzzleCopyWithImpl<$Res, _$CodePuzzleImpl>
    implements _$$CodePuzzleImplCopyWith<$Res> {
  __$$CodePuzzleImplCopyWithImpl(
      _$CodePuzzleImpl _value, $Res Function(_$CodePuzzleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? hints = null,
  }) {
    return _then(_$CodePuzzleImpl(
      code: null == code
          ? _value._code
          : code // ignore: cast_nullable_to_non_nullable
              as List<int>,
      hints: null == hints
          ? _value._hints
          : hints // ignore: cast_nullable_to_non_nullable
              as List<List<int>>,
    ));
  }
}

/// @nodoc

class _$CodePuzzleImpl implements _CodePuzzle {
  _$CodePuzzleImpl(
      {required final List<int> code, required final List<List<int>> hints})
      : _code = code,
        _hints = hints;

  final List<int> _code;
  @override
  List<int> get code {
    if (_code is EqualUnmodifiableListView) return _code;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_code);
  }

  final List<List<int>> _hints;
  @override
  List<List<int>> get hints {
    if (_hints is EqualUnmodifiableListView) return _hints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hints);
  }

  @override
  String toString() {
    return 'CodePuzzle(code: $code, hints: $hints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CodePuzzleImpl &&
            const DeepCollectionEquality().equals(other._code, _code) &&
            const DeepCollectionEquality().equals(other._hints, _hints));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_code),
      const DeepCollectionEquality().hash(_hints));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CodePuzzleImplCopyWith<_$CodePuzzleImpl> get copyWith =>
      __$$CodePuzzleImplCopyWithImpl<_$CodePuzzleImpl>(this, _$identity);
}

abstract class _CodePuzzle implements CodePuzzle {
  factory _CodePuzzle(
      {required final List<int> code,
      required final List<List<int>> hints}) = _$CodePuzzleImpl;

  @override
  List<int> get code;
  @override
  List<List<int>> get hints;
  @override
  @JsonKey(ignore: true)
  _$$CodePuzzleImplCopyWith<_$CodePuzzleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
