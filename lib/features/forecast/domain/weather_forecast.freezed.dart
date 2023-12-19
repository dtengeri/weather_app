// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherForecast {
  Location get location => throw _privateConstructorUsedError;
  DateTime get requestedAt => throw _privateConstructorUsedError;
  CurrentWeatherCondition get currentWeatherCondition =>
      throw _privateConstructorUsedError;
  List<DailyWeatherCondition> get dailyForecast =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherForecastCopyWith<WeatherForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastCopyWith<$Res> {
  factory $WeatherForecastCopyWith(
          WeatherForecast value, $Res Function(WeatherForecast) then) =
      _$WeatherForecastCopyWithImpl<$Res, WeatherForecast>;
  @useResult
  $Res call(
      {Location location,
      DateTime requestedAt,
      CurrentWeatherCondition currentWeatherCondition,
      List<DailyWeatherCondition> dailyForecast});

  $LocationCopyWith<$Res> get location;
  $CurrentWeatherConditionCopyWith<$Res> get currentWeatherCondition;
}

/// @nodoc
class _$WeatherForecastCopyWithImpl<$Res, $Val extends WeatherForecast>
    implements $WeatherForecastCopyWith<$Res> {
  _$WeatherForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? requestedAt = null,
    Object? currentWeatherCondition = null,
    Object? dailyForecast = null,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      requestedAt: null == requestedAt
          ? _value.requestedAt
          : requestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentWeatherCondition: null == currentWeatherCondition
          ? _value.currentWeatherCondition
          : currentWeatherCondition // ignore: cast_nullable_to_non_nullable
              as CurrentWeatherCondition,
      dailyForecast: null == dailyForecast
          ? _value.dailyForecast
          : dailyForecast // ignore: cast_nullable_to_non_nullable
              as List<DailyWeatherCondition>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentWeatherConditionCopyWith<$Res> get currentWeatherCondition {
    return $CurrentWeatherConditionCopyWith<$Res>(
        _value.currentWeatherCondition, (value) {
      return _then(_value.copyWith(currentWeatherCondition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherForecastImplCopyWith<$Res>
    implements $WeatherForecastCopyWith<$Res> {
  factory _$$WeatherForecastImplCopyWith(_$WeatherForecastImpl value,
          $Res Function(_$WeatherForecastImpl) then) =
      __$$WeatherForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Location location,
      DateTime requestedAt,
      CurrentWeatherCondition currentWeatherCondition,
      List<DailyWeatherCondition> dailyForecast});

  @override
  $LocationCopyWith<$Res> get location;
  @override
  $CurrentWeatherConditionCopyWith<$Res> get currentWeatherCondition;
}

/// @nodoc
class __$$WeatherForecastImplCopyWithImpl<$Res>
    extends _$WeatherForecastCopyWithImpl<$Res, _$WeatherForecastImpl>
    implements _$$WeatherForecastImplCopyWith<$Res> {
  __$$WeatherForecastImplCopyWithImpl(
      _$WeatherForecastImpl _value, $Res Function(_$WeatherForecastImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? requestedAt = null,
    Object? currentWeatherCondition = null,
    Object? dailyForecast = null,
  }) {
    return _then(_$WeatherForecastImpl(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      requestedAt: null == requestedAt
          ? _value.requestedAt
          : requestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentWeatherCondition: null == currentWeatherCondition
          ? _value.currentWeatherCondition
          : currentWeatherCondition // ignore: cast_nullable_to_non_nullable
              as CurrentWeatherCondition,
      dailyForecast: null == dailyForecast
          ? _value._dailyForecast
          : dailyForecast // ignore: cast_nullable_to_non_nullable
              as List<DailyWeatherCondition>,
    ));
  }
}

/// @nodoc

class _$WeatherForecastImpl implements _WeatherForecast {
  const _$WeatherForecastImpl(
      {required this.location,
      required this.requestedAt,
      required this.currentWeatherCondition,
      required final List<DailyWeatherCondition> dailyForecast})
      : _dailyForecast = dailyForecast;

  @override
  final Location location;
  @override
  final DateTime requestedAt;
  @override
  final CurrentWeatherCondition currentWeatherCondition;
  final List<DailyWeatherCondition> _dailyForecast;
  @override
  List<DailyWeatherCondition> get dailyForecast {
    if (_dailyForecast is EqualUnmodifiableListView) return _dailyForecast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyForecast);
  }

  @override
  String toString() {
    return 'WeatherForecast(location: $location, requestedAt: $requestedAt, currentWeatherCondition: $currentWeatherCondition, dailyForecast: $dailyForecast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherForecastImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.requestedAt, requestedAt) ||
                other.requestedAt == requestedAt) &&
            (identical(
                    other.currentWeatherCondition, currentWeatherCondition) ||
                other.currentWeatherCondition == currentWeatherCondition) &&
            const DeepCollectionEquality()
                .equals(other._dailyForecast, _dailyForecast));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      location,
      requestedAt,
      currentWeatherCondition,
      const DeepCollectionEquality().hash(_dailyForecast));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherForecastImplCopyWith<_$WeatherForecastImpl> get copyWith =>
      __$$WeatherForecastImplCopyWithImpl<_$WeatherForecastImpl>(
          this, _$identity);
}

abstract class _WeatherForecast implements WeatherForecast {
  const factory _WeatherForecast(
          {required final Location location,
          required final DateTime requestedAt,
          required final CurrentWeatherCondition currentWeatherCondition,
          required final List<DailyWeatherCondition> dailyForecast}) =
      _$WeatherForecastImpl;

  @override
  Location get location;
  @override
  DateTime get requestedAt;
  @override
  CurrentWeatherCondition get currentWeatherCondition;
  @override
  List<DailyWeatherCondition> get dailyForecast;
  @override
  @JsonKey(ignore: true)
  _$$WeatherForecastImplCopyWith<_$WeatherForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
