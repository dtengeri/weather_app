// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_theme_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherThemeState {
  ThemeData get currentLightTheme => throw _privateConstructorUsedError;
  ThemeData get currentDarkTheme => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherThemeStateCopyWith<WeatherThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherThemeStateCopyWith<$Res> {
  factory $WeatherThemeStateCopyWith(
          WeatherThemeState value, $Res Function(WeatherThemeState) then) =
      _$WeatherThemeStateCopyWithImpl<$Res, WeatherThemeState>;
  @useResult
  $Res call({ThemeData currentLightTheme, ThemeData currentDarkTheme});
}

/// @nodoc
class _$WeatherThemeStateCopyWithImpl<$Res, $Val extends WeatherThemeState>
    implements $WeatherThemeStateCopyWith<$Res> {
  _$WeatherThemeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentLightTheme = freezed,
    Object? currentDarkTheme = freezed,
  }) {
    return _then(_value.copyWith(
      currentLightTheme: freezed == currentLightTheme
          ? _value.currentLightTheme
          : currentLightTheme // ignore: cast_nullable_to_non_nullable
              as ThemeData,
      currentDarkTheme: freezed == currentDarkTheme
          ? _value.currentDarkTheme
          : currentDarkTheme // ignore: cast_nullable_to_non_nullable
              as ThemeData,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherThemeStateImplCopyWith<$Res>
    implements $WeatherThemeStateCopyWith<$Res> {
  factory _$$WeatherThemeStateImplCopyWith(_$WeatherThemeStateImpl value,
          $Res Function(_$WeatherThemeStateImpl) then) =
      __$$WeatherThemeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeData currentLightTheme, ThemeData currentDarkTheme});
}

/// @nodoc
class __$$WeatherThemeStateImplCopyWithImpl<$Res>
    extends _$WeatherThemeStateCopyWithImpl<$Res, _$WeatherThemeStateImpl>
    implements _$$WeatherThemeStateImplCopyWith<$Res> {
  __$$WeatherThemeStateImplCopyWithImpl(_$WeatherThemeStateImpl _value,
      $Res Function(_$WeatherThemeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentLightTheme = freezed,
    Object? currentDarkTheme = freezed,
  }) {
    return _then(_$WeatherThemeStateImpl(
      currentLightTheme: freezed == currentLightTheme
          ? _value.currentLightTheme
          : currentLightTheme // ignore: cast_nullable_to_non_nullable
              as ThemeData,
      currentDarkTheme: freezed == currentDarkTheme
          ? _value.currentDarkTheme
          : currentDarkTheme // ignore: cast_nullable_to_non_nullable
              as ThemeData,
    ));
  }
}

/// @nodoc

class _$WeatherThemeStateImpl implements _WeatherThemeState {
  const _$WeatherThemeStateImpl(
      {required this.currentLightTheme, required this.currentDarkTheme});

  @override
  final ThemeData currentLightTheme;
  @override
  final ThemeData currentDarkTheme;

  @override
  String toString() {
    return 'WeatherThemeState(currentLightTheme: $currentLightTheme, currentDarkTheme: $currentDarkTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherThemeStateImpl &&
            const DeepCollectionEquality()
                .equals(other.currentLightTheme, currentLightTheme) &&
            const DeepCollectionEquality()
                .equals(other.currentDarkTheme, currentDarkTheme));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentLightTheme),
      const DeepCollectionEquality().hash(currentDarkTheme));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherThemeStateImplCopyWith<_$WeatherThemeStateImpl> get copyWith =>
      __$$WeatherThemeStateImplCopyWithImpl<_$WeatherThemeStateImpl>(
          this, _$identity);
}

abstract class _WeatherThemeState implements WeatherThemeState {
  const factory _WeatherThemeState(
      {required final ThemeData currentLightTheme,
      required final ThemeData currentDarkTheme}) = _$WeatherThemeStateImpl;

  @override
  ThemeData get currentLightTheme;
  @override
  ThemeData get currentDarkTheme;
  @override
  @JsonKey(ignore: true)
  _$$WeatherThemeStateImplCopyWith<_$WeatherThemeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
