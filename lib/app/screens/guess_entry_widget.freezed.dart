// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guess_entry_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GuessEntryStateData {

 List<int> get guess;
/// Create a copy of GuessEntryStateData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuessEntryStateDataCopyWith<GuessEntryStateData> get copyWith => _$GuessEntryStateDataCopyWithImpl<GuessEntryStateData>(this as GuessEntryStateData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuessEntryStateData&&const DeepCollectionEquality().equals(other.guess, guess));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(guess));

@override
String toString() {
  return 'GuessEntryStateData(guess: $guess)';
}


}

/// @nodoc
abstract mixin class $GuessEntryStateDataCopyWith<$Res>  {
  factory $GuessEntryStateDataCopyWith(GuessEntryStateData value, $Res Function(GuessEntryStateData) _then) = _$GuessEntryStateDataCopyWithImpl;
@useResult
$Res call({
 List<int> guess
});




}
/// @nodoc
class _$GuessEntryStateDataCopyWithImpl<$Res>
    implements $GuessEntryStateDataCopyWith<$Res> {
  _$GuessEntryStateDataCopyWithImpl(this._self, this._then);

  final GuessEntryStateData _self;
  final $Res Function(GuessEntryStateData) _then;

/// Create a copy of GuessEntryStateData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? guess = null,}) {
  return _then(_self.copyWith(
guess: null == guess ? _self.guess : guess // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [GuessEntryStateData].
extension GuessEntryStateDataPatterns on GuessEntryStateData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuessEntryStateData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuessEntryStateData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuessEntryStateData value)  $default,){
final _that = this;
switch (_that) {
case _GuessEntryStateData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuessEntryStateData value)?  $default,){
final _that = this;
switch (_that) {
case _GuessEntryStateData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> guess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuessEntryStateData() when $default != null:
return $default(_that.guess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> guess)  $default,) {final _that = this;
switch (_that) {
case _GuessEntryStateData():
return $default(_that.guess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> guess)?  $default,) {final _that = this;
switch (_that) {
case _GuessEntryStateData() when $default != null:
return $default(_that.guess);case _:
  return null;

}
}

}

/// @nodoc


class _GuessEntryStateData implements GuessEntryStateData {
   _GuessEntryStateData({final  List<int> guess = const []}): _guess = guess;
  

 final  List<int> _guess;
@override@JsonKey() List<int> get guess {
  if (_guess is EqualUnmodifiableListView) return _guess;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_guess);
}


/// Create a copy of GuessEntryStateData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuessEntryStateDataCopyWith<_GuessEntryStateData> get copyWith => __$GuessEntryStateDataCopyWithImpl<_GuessEntryStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuessEntryStateData&&const DeepCollectionEquality().equals(other._guess, _guess));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_guess));

@override
String toString() {
  return 'GuessEntryStateData(guess: $guess)';
}


}

/// @nodoc
abstract mixin class _$GuessEntryStateDataCopyWith<$Res> implements $GuessEntryStateDataCopyWith<$Res> {
  factory _$GuessEntryStateDataCopyWith(_GuessEntryStateData value, $Res Function(_GuessEntryStateData) _then) = __$GuessEntryStateDataCopyWithImpl;
@override @useResult
$Res call({
 List<int> guess
});




}
/// @nodoc
class __$GuessEntryStateDataCopyWithImpl<$Res>
    implements _$GuessEntryStateDataCopyWith<$Res> {
  __$GuessEntryStateDataCopyWithImpl(this._self, this._then);

  final _GuessEntryStateData _self;
  final $Res Function(_GuessEntryStateData) _then;

/// Create a copy of GuessEntryStateData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? guess = null,}) {
  return _then(_GuessEntryStateData(
guess: null == guess ? _self._guess : guess // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
