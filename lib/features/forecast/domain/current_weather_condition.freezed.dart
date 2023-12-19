// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_weather_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CurrentWeatherCondition {
  Temperature get temperature => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;
  WeatherCode get weatherCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentWeatherConditionCopyWith<CurrentWeatherCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentWeatherConditionCopyWith<$Res> {
  factory $CurrentWeatherConditionCopyWith(CurrentWeatherCondition value,
          $Res Function(CurrentWeatherCondition) then) =
      _$CurrentWeatherConditionCopyWithImpl<$Res, CurrentWeatherCondition>;
  @useResult
  $Res call({Temperature temperature, int humidity, WeatherCode weatherCode});

  $TemperatureCopyWith<$Res> get temperature;
}

/// @nodoc
class _$CurrentWeatherConditionCopyWithImpl<$Res,
        $Val extends CurrentWeatherCondition>
    implements $CurrentWeatherConditionCopyWith<$Res> {
  _$CurrentWeatherConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? humidity = null,
    Object? weatherCode = null,
  }) {
    return _then(_value.copyWith(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as Temperature,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      weatherCode: null == weatherCode
          ? _value.weatherCode
          : weatherCode // ignore: cast_nullable_to_non_nullable
              as WeatherCode,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemperatureCopyWith<$Res> get temperature {
    return $TemperatureCopyWith<$Res>(_value.temperature, (value) {
      return _then(_value.copyWith(temperature: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurrentWeatherConditionImplCopyWith<$Res>
    implements $CurrentWeatherConditionCopyWith<$Res> {
  factory _$$CurrentWeatherConditionImplCopyWith(
          _$CurrentWeatherConditionImpl value,
          $Res Function(_$CurrentWeatherConditionImpl) then) =
      __$$CurrentWeatherConditionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Temperature temperature, int humidity, WeatherCode weatherCode});

  @override
  $TemperatureCopyWith<$Res> get temperature;
}

/// @nodoc
class __$$CurrentWeatherConditionImplCopyWithImpl<$Res>
    extends _$CurrentWeatherConditionCopyWithImpl<$Res,
        _$CurrentWeatherConditionImpl>
    implements _$$CurrentWeatherConditionImplCopyWith<$Res> {
  __$$CurrentWeatherConditionImplCopyWithImpl(
      _$CurrentWeatherConditionImpl _value,
      $Res Function(_$CurrentWeatherConditionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? humidity = null,
    Object? weatherCode = null,
  }) {
    return _then(_$CurrentWeatherConditionImpl(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as Temperature,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      weatherCode: null == weatherCode
          ? _value.weatherCode
          : weatherCode // ignore: cast_nullable_to_non_nullable
              as WeatherCode,
    ));
  }
}

/// @nodoc

class _$CurrentWeatherConditionImpl implements _CurrentWeatherCondition {
  const _$CurrentWeatherConditionImpl(
      {required this.temperature,
      required this.humidity,
      required this.weatherCode});

  @override
  final Temperature temperature;
  @override
  final int humidity;
  @override
  final WeatherCode weatherCode;

  @override
  String toString() {
    return 'CurrentWeatherCondition(temperature: $temperature, humidity: $humidity, weatherCode: $weatherCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentWeatherConditionImpl &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.weatherCode, weatherCode) ||
                other.weatherCode == weatherCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, temperature, humidity, weatherCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentWeatherConditionImplCopyWith<_$CurrentWeatherConditionImpl>
      get copyWith => __$$CurrentWeatherConditionImplCopyWithImpl<
          _$CurrentWeatherConditionImpl>(this, _$identity);
}

abstract class _CurrentWeatherCondition implements CurrentWeatherCondition {
  const factory _CurrentWeatherCondition(
      {required final Temperature temperature,
      required final int humidity,
      required final WeatherCode weatherCode}) = _$CurrentWeatherConditionImpl;

  @override
  Temperature get temperature;
  @override
  int get humidity;
  @override
  WeatherCode get weatherCode;
  @override
  @JsonKey(ignore: true)
  _$$CurrentWeatherConditionImplCopyWith<_$CurrentWeatherConditionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
