// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodayStateData {

 int get counter; List<int> get code; List<int> get guess; List<int> get oneGuess; List<List<int>> get guesses; int get correct; int get wellPlaced; CodePuzzle? get puzzle;
/// Create a copy of TodayStateData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayStateDataCopyWith<TodayStateData> get copyWith => _$TodayStateDataCopyWithImpl<TodayStateData>(this as TodayStateData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayStateData&&(identical(other.counter, counter) || other.counter == counter)&&const DeepCollectionEquality().equals(other.code, code)&&const DeepCollectionEquality().equals(other.guess, guess)&&const DeepCollectionEquality().equals(other.oneGuess, oneGuess)&&const DeepCollectionEquality().equals(other.guesses, guesses)&&(identical(other.correct, correct) || other.correct == correct)&&(identical(other.wellPlaced, wellPlaced) || other.wellPlaced == wellPlaced)&&(identical(other.puzzle, puzzle) || other.puzzle == puzzle));
}


@override
int get hashCode => Object.hash(runtimeType,counter,const DeepCollectionEquality().hash(code),const DeepCollectionEquality().hash(guess),const DeepCollectionEquality().hash(oneGuess),const DeepCollectionEquality().hash(guesses),correct,wellPlaced,puzzle);

@override
String toString() {
  return 'TodayStateData(counter: $counter, code: $code, guess: $guess, oneGuess: $oneGuess, guesses: $guesses, correct: $correct, wellPlaced: $wellPlaced, puzzle: $puzzle)';
}


}

/// @nodoc
abstract mixin class $TodayStateDataCopyWith<$Res>  {
  factory $TodayStateDataCopyWith(TodayStateData value, $Res Function(TodayStateData) _then) = _$TodayStateDataCopyWithImpl;
@useResult
$Res call({
 int counter, List<int> code, List<int> guess, List<int> oneGuess, List<List<int>> guesses, int correct, int wellPlaced, CodePuzzle? puzzle
});


$CodePuzzleCopyWith<$Res>? get puzzle;

}
/// @nodoc
class _$TodayStateDataCopyWithImpl<$Res>
    implements $TodayStateDataCopyWith<$Res> {
  _$TodayStateDataCopyWithImpl(this._self, this._then);

  final TodayStateData _self;
  final $Res Function(TodayStateData) _then;

/// Create a copy of TodayStateData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? counter = null,Object? code = null,Object? guess = null,Object? oneGuess = null,Object? guesses = null,Object? correct = null,Object? wellPlaced = null,Object? puzzle = freezed,}) {
  return _then(_self.copyWith(
counter: null == counter ? _self.counter : counter // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as List<int>,guess: null == guess ? _self.guess : guess // ignore: cast_nullable_to_non_nullable
as List<int>,oneGuess: null == oneGuess ? _self.oneGuess : oneGuess // ignore: cast_nullable_to_non_nullable
as List<int>,guesses: null == guesses ? _self.guesses : guesses // ignore: cast_nullable_to_non_nullable
as List<List<int>>,correct: null == correct ? _self.correct : correct // ignore: cast_nullable_to_non_nullable
as int,wellPlaced: null == wellPlaced ? _self.wellPlaced : wellPlaced // ignore: cast_nullable_to_non_nullable
as int,puzzle: freezed == puzzle ? _self.puzzle : puzzle // ignore: cast_nullable_to_non_nullable
as CodePuzzle?,
  ));
}
/// Create a copy of TodayStateData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CodePuzzleCopyWith<$Res>? get puzzle {
    if (_self.puzzle == null) {
    return null;
  }

  return $CodePuzzleCopyWith<$Res>(_self.puzzle!, (value) {
    return _then(_self.copyWith(puzzle: value));
  });
}
}


/// Adds pattern-matching-related methods to [TodayStateData].
extension TodayStateDataPatterns on TodayStateData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodayStateData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodayStateData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodayStateData value)  $default,){
final _that = this;
switch (_that) {
case _TodayStateData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodayStateData value)?  $default,){
final _that = this;
switch (_that) {
case _TodayStateData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int counter,  List<int> code,  List<int> guess,  List<int> oneGuess,  List<List<int>> guesses,  int correct,  int wellPlaced,  CodePuzzle? puzzle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodayStateData() when $default != null:
return $default(_that.counter,_that.code,_that.guess,_that.oneGuess,_that.guesses,_that.correct,_that.wellPlaced,_that.puzzle);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int counter,  List<int> code,  List<int> guess,  List<int> oneGuess,  List<List<int>> guesses,  int correct,  int wellPlaced,  CodePuzzle? puzzle)  $default,) {final _that = this;
switch (_that) {
case _TodayStateData():
return $default(_that.counter,_that.code,_that.guess,_that.oneGuess,_that.guesses,_that.correct,_that.wellPlaced,_that.puzzle);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int counter,  List<int> code,  List<int> guess,  List<int> oneGuess,  List<List<int>> guesses,  int correct,  int wellPlaced,  CodePuzzle? puzzle)?  $default,) {final _that = this;
switch (_that) {
case _TodayStateData() when $default != null:
return $default(_that.counter,_that.code,_that.guess,_that.oneGuess,_that.guesses,_that.correct,_that.wellPlaced,_that.puzzle);case _:
  return null;

}
}

}

/// @nodoc


class _TodayStateData implements TodayStateData {
   _TodayStateData({this.counter = 0, final  List<int> code = const [], final  List<int> guess = const [], final  List<int> oneGuess = const [], final  List<List<int>> guesses = const [], this.correct = 0, this.wellPlaced = 0, this.puzzle}): _code = code,_guess = guess,_oneGuess = oneGuess,_guesses = guesses;
  

@override@JsonKey() final  int counter;
 final  List<int> _code;
@override@JsonKey() List<int> get code {
  if (_code is EqualUnmodifiableListView) return _code;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_code);
}

 final  List<int> _guess;
@override@JsonKey() List<int> get guess {
  if (_guess is EqualUnmodifiableListView) return _guess;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_guess);
}

 final  List<int> _oneGuess;
@override@JsonKey() List<int> get oneGuess {
  if (_oneGuess is EqualUnmodifiableListView) return _oneGuess;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_oneGuess);
}

 final  List<List<int>> _guesses;
@override@JsonKey() List<List<int>> get guesses {
  if (_guesses is EqualUnmodifiableListView) return _guesses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_guesses);
}

@override@JsonKey() final  int correct;
@override@JsonKey() final  int wellPlaced;
@override final  CodePuzzle? puzzle;

/// Create a copy of TodayStateData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodayStateDataCopyWith<_TodayStateData> get copyWith => __$TodayStateDataCopyWithImpl<_TodayStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodayStateData&&(identical(other.counter, counter) || other.counter == counter)&&const DeepCollectionEquality().equals(other._code, _code)&&const DeepCollectionEquality().equals(other._guess, _guess)&&const DeepCollectionEquality().equals(other._oneGuess, _oneGuess)&&const DeepCollectionEquality().equals(other._guesses, _guesses)&&(identical(other.correct, correct) || other.correct == correct)&&(identical(other.wellPlaced, wellPlaced) || other.wellPlaced == wellPlaced)&&(identical(other.puzzle, puzzle) || other.puzzle == puzzle));
}


@override
int get hashCode => Object.hash(runtimeType,counter,const DeepCollectionEquality().hash(_code),const DeepCollectionEquality().hash(_guess),const DeepCollectionEquality().hash(_oneGuess),const DeepCollectionEquality().hash(_guesses),correct,wellPlaced,puzzle);

@override
String toString() {
  return 'TodayStateData(counter: $counter, code: $code, guess: $guess, oneGuess: $oneGuess, guesses: $guesses, correct: $correct, wellPlaced: $wellPlaced, puzzle: $puzzle)';
}


}

/// @nodoc
abstract mixin class _$TodayStateDataCopyWith<$Res> implements $TodayStateDataCopyWith<$Res> {
  factory _$TodayStateDataCopyWith(_TodayStateData value, $Res Function(_TodayStateData) _then) = __$TodayStateDataCopyWithImpl;
@override @useResult
$Res call({
 int counter, List<int> code, List<int> guess, List<int> oneGuess, List<List<int>> guesses, int correct, int wellPlaced, CodePuzzle? puzzle
});


@override $CodePuzzleCopyWith<$Res>? get puzzle;

}
/// @nodoc
class __$TodayStateDataCopyWithImpl<$Res>
    implements _$TodayStateDataCopyWith<$Res> {
  __$TodayStateDataCopyWithImpl(this._self, this._then);

  final _TodayStateData _self;
  final $Res Function(_TodayStateData) _then;

/// Create a copy of TodayStateData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? counter = null,Object? code = null,Object? guess = null,Object? oneGuess = null,Object? guesses = null,Object? correct = null,Object? wellPlaced = null,Object? puzzle = freezed,}) {
  return _then(_TodayStateData(
counter: null == counter ? _self.counter : counter // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self._code : code // ignore: cast_nullable_to_non_nullable
as List<int>,guess: null == guess ? _self._guess : guess // ignore: cast_nullable_to_non_nullable
as List<int>,oneGuess: null == oneGuess ? _self._oneGuess : oneGuess // ignore: cast_nullable_to_non_nullable
as List<int>,guesses: null == guesses ? _self._guesses : guesses // ignore: cast_nullable_to_non_nullable
as List<List<int>>,correct: null == correct ? _self.correct : correct // ignore: cast_nullable_to_non_nullable
as int,wellPlaced: null == wellPlaced ? _self.wellPlaced : wellPlaced // ignore: cast_nullable_to_non_nullable
as int,puzzle: freezed == puzzle ? _self.puzzle : puzzle // ignore: cast_nullable_to_non_nullable
as CodePuzzle?,
  ));
}

/// Create a copy of TodayStateData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CodePuzzleCopyWith<$Res>? get puzzle {
    if (_self.puzzle == null) {
    return null;
  }

  return $CodePuzzleCopyWith<$Res>(_self.puzzle!, (value) {
    return _then(_self.copyWith(puzzle: value));
  });
}
}

// dart format on
