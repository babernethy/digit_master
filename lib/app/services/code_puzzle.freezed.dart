// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'code_puzzle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CodePuzzle {

 List<int> get code; List<List<int>> get hints;
/// Create a copy of CodePuzzle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CodePuzzleCopyWith<CodePuzzle> get copyWith => _$CodePuzzleCopyWithImpl<CodePuzzle>(this as CodePuzzle, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CodePuzzle&&const DeepCollectionEquality().equals(other.code, code)&&const DeepCollectionEquality().equals(other.hints, hints));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(code),const DeepCollectionEquality().hash(hints));

@override
String toString() {
  return 'CodePuzzle(code: $code, hints: $hints)';
}


}

/// @nodoc
abstract mixin class $CodePuzzleCopyWith<$Res>  {
  factory $CodePuzzleCopyWith(CodePuzzle value, $Res Function(CodePuzzle) _then) = _$CodePuzzleCopyWithImpl;
@useResult
$Res call({
 List<int> code, List<List<int>> hints
});




}
/// @nodoc
class _$CodePuzzleCopyWithImpl<$Res>
    implements $CodePuzzleCopyWith<$Res> {
  _$CodePuzzleCopyWithImpl(this._self, this._then);

  final CodePuzzle _self;
  final $Res Function(CodePuzzle) _then;

/// Create a copy of CodePuzzle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? hints = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as List<int>,hints: null == hints ? _self.hints : hints // ignore: cast_nullable_to_non_nullable
as List<List<int>>,
  ));
}

}


/// Adds pattern-matching-related methods to [CodePuzzle].
extension CodePuzzlePatterns on CodePuzzle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CodePuzzle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CodePuzzle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CodePuzzle value)  $default,){
final _that = this;
switch (_that) {
case _CodePuzzle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CodePuzzle value)?  $default,){
final _that = this;
switch (_that) {
case _CodePuzzle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> code,  List<List<int>> hints)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CodePuzzle() when $default != null:
return $default(_that.code,_that.hints);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> code,  List<List<int>> hints)  $default,) {final _that = this;
switch (_that) {
case _CodePuzzle():
return $default(_that.code,_that.hints);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> code,  List<List<int>> hints)?  $default,) {final _that = this;
switch (_that) {
case _CodePuzzle() when $default != null:
return $default(_that.code,_that.hints);case _:
  return null;

}
}

}

/// @nodoc


class _CodePuzzle implements CodePuzzle {
   _CodePuzzle({required final  List<int> code, required final  List<List<int>> hints}): _code = code,_hints = hints;
  

 final  List<int> _code;
@override List<int> get code {
  if (_code is EqualUnmodifiableListView) return _code;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_code);
}

 final  List<List<int>> _hints;
@override List<List<int>> get hints {
  if (_hints is EqualUnmodifiableListView) return _hints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hints);
}


/// Create a copy of CodePuzzle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CodePuzzleCopyWith<_CodePuzzle> get copyWith => __$CodePuzzleCopyWithImpl<_CodePuzzle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CodePuzzle&&const DeepCollectionEquality().equals(other._code, _code)&&const DeepCollectionEquality().equals(other._hints, _hints));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_code),const DeepCollectionEquality().hash(_hints));

@override
String toString() {
  return 'CodePuzzle(code: $code, hints: $hints)';
}


}

/// @nodoc
abstract mixin class _$CodePuzzleCopyWith<$Res> implements $CodePuzzleCopyWith<$Res> {
  factory _$CodePuzzleCopyWith(_CodePuzzle value, $Res Function(_CodePuzzle) _then) = __$CodePuzzleCopyWithImpl;
@override @useResult
$Res call({
 List<int> code, List<List<int>> hints
});




}
/// @nodoc
class __$CodePuzzleCopyWithImpl<$Res>
    implements _$CodePuzzleCopyWith<$Res> {
  __$CodePuzzleCopyWithImpl(this._self, this._then);

  final _CodePuzzle _self;
  final $Res Function(_CodePuzzle) _then;

/// Create a copy of CodePuzzle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? hints = null,}) {
  return _then(_CodePuzzle(
code: null == code ? _self._code : code // ignore: cast_nullable_to_non_nullable
as List<int>,hints: null == hints ? _self._hints : hints // ignore: cast_nullable_to_non_nullable
as List<List<int>>,
  ));
}


}

// dart format on
