// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppModelState {
  GoRouter? get router => throw _privateConstructorUsedError;
  SharedPreferences? get sharedPreferences =>
      throw _privateConstructorUsedError; // InAppReview? inAppReview,
// FirebaseAnalytics? analytics,
  Isar? get isarInstance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppModelStateCopyWith<AppModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppModelStateCopyWith<$Res> {
  factory $AppModelStateCopyWith(
          AppModelState value, $Res Function(AppModelState) then) =
      _$AppModelStateCopyWithImpl<$Res, AppModelState>;
  @useResult
  $Res call(
      {GoRouter? router,
      SharedPreferences? sharedPreferences,
      Isar? isarInstance});
}

/// @nodoc
class _$AppModelStateCopyWithImpl<$Res, $Val extends AppModelState>
    implements $AppModelStateCopyWith<$Res> {
  _$AppModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? router = freezed,
    Object? sharedPreferences = freezed,
    Object? isarInstance = freezed,
  }) {
    return _then(_value.copyWith(
      router: freezed == router
          ? _value.router
          : router // ignore: cast_nullable_to_non_nullable
              as GoRouter?,
      sharedPreferences: freezed == sharedPreferences
          ? _value.sharedPreferences
          : sharedPreferences // ignore: cast_nullable_to_non_nullable
              as SharedPreferences?,
      isarInstance: freezed == isarInstance
          ? _value.isarInstance
          : isarInstance // ignore: cast_nullable_to_non_nullable
              as Isar?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppModelStateCopyWith<$Res>
    implements $AppModelStateCopyWith<$Res> {
  factory _$$_AppModelStateCopyWith(
          _$_AppModelState value, $Res Function(_$_AppModelState) then) =
      __$$_AppModelStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GoRouter? router,
      SharedPreferences? sharedPreferences,
      Isar? isarInstance});
}

/// @nodoc
class __$$_AppModelStateCopyWithImpl<$Res>
    extends _$AppModelStateCopyWithImpl<$Res, _$_AppModelState>
    implements _$$_AppModelStateCopyWith<$Res> {
  __$$_AppModelStateCopyWithImpl(
      _$_AppModelState _value, $Res Function(_$_AppModelState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? router = freezed,
    Object? sharedPreferences = freezed,
    Object? isarInstance = freezed,
  }) {
    return _then(_$_AppModelState(
      freezed == router
          ? _value.router
          : router // ignore: cast_nullable_to_non_nullable
              as GoRouter?,
      freezed == sharedPreferences
          ? _value.sharedPreferences
          : sharedPreferences // ignore: cast_nullable_to_non_nullable
              as SharedPreferences?,
      freezed == isarInstance
          ? _value.isarInstance
          : isarInstance // ignore: cast_nullable_to_non_nullable
              as Isar?,
    ));
  }
}

/// @nodoc

class _$_AppModelState implements _AppModelState {
  const _$_AppModelState(
      this.router, this.sharedPreferences, this.isarInstance);

  @override
  final GoRouter? router;
  @override
  final SharedPreferences? sharedPreferences;
// InAppReview? inAppReview,
// FirebaseAnalytics? analytics,
  @override
  final Isar? isarInstance;

  @override
  String toString() {
    return 'AppModelState(router: $router, sharedPreferences: $sharedPreferences, isarInstance: $isarInstance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppModelState &&
            (identical(other.router, router) || other.router == router) &&
            (identical(other.sharedPreferences, sharedPreferences) ||
                other.sharedPreferences == sharedPreferences) &&
            (identical(other.isarInstance, isarInstance) ||
                other.isarInstance == isarInstance));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, router, sharedPreferences, isarInstance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppModelStateCopyWith<_$_AppModelState> get copyWith =>
      __$$_AppModelStateCopyWithImpl<_$_AppModelState>(this, _$identity);
}

abstract class _AppModelState implements AppModelState {
  const factory _AppModelState(
      final GoRouter? router,
      final SharedPreferences? sharedPreferences,
      final Isar? isarInstance) = _$_AppModelState;

  @override
  GoRouter? get router;
  @override
  SharedPreferences? get sharedPreferences;
  @override // InAppReview? inAppReview,
// FirebaseAnalytics? analytics,
  Isar? get isarInstance;
  @override
  @JsonKey(ignore: true)
  _$$_AppModelStateCopyWith<_$_AppModelState> get copyWith =>
      throw _privateConstructorUsedError;
}
