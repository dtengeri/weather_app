// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather_app/features/core/infrastructure/object_box.dart'
    as _i4;
import 'package:weather_app/features/forecast/application/location/location_cubit.dart'
    as _i23;
import 'package:weather_app/features/forecast/application/location/location_search_cubit.dart'
    as _i18;
import 'package:weather_app/features/forecast/application/weather/weather_forecast_cubit.dart'
    as _i24;
import 'package:weather_app/features/forecast/application/weather/weather_theme_cubit.dart'
    as _i9;
import 'package:weather_app/features/forecast/domain/location_repository.dart'
    as _i16;
import 'package:weather_app/features/forecast/domain/weather_repository.dart'
    as _i19;
import 'package:weather_app/features/forecast/infrastructure/datasource/local/location/local_location_datasource.dart'
    as _i12;
import 'package:weather_app/features/forecast/infrastructure/datasource/local/location/object_box_local_location_datasource.dart'
    as _i13;
import 'package:weather_app/features/forecast/infrastructure/datasource/local/weather/local_weather_forecast_datasource.dart'
    as _i14;
import 'package:weather_app/features/forecast/infrastructure/datasource/local/weather/object_box_local_weather_forecast_datasource.dart'
    as _i15;
import 'package:weather_app/features/forecast/infrastructure/datasource/remote/location/open_meteo_remote_location_datasource.dart'
    as _i6;
import 'package:weather_app/features/forecast/infrastructure/datasource/remote/location/remote_location_datasource.dart'
    as _i5;
import 'package:weather_app/features/forecast/infrastructure/datasource/remote/weather/open_meteo_remote_weather_forecast_datasource.dart'
    as _i8;
import 'package:weather_app/features/forecast/infrastructure/datasource/remote/weather/remote_weather_forecast_datasource.dart'
    as _i7;
import 'package:weather_app/features/forecast/infrastructure/location_repository_impl.dart'
    as _i17;
import 'package:weather_app/features/forecast/infrastructure/weather_repository_impl.dart'
    as _i20;
import 'package:weather_app/features/settings/application/app_settings_cubit.dart'
    as _i25;
import 'package:weather_app/features/settings/domain/app_settings_repository.dart'
    as _i21;
import 'package:weather_app/features/settings/infrastructure/app_settings_repository_impl.dart'
    as _i22;
import 'package:weather_app/features/settings/infrastructure/datasource/local/local_app_settings_datasource.dart'
    as _i10;
import 'package:weather_app/features/settings/infrastructure/datasource/local/object_box_local_app_settings_datasource.dart'
    as _i11;
import 'package:weather_app/services.dart' as _i26;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.Dio>(registerModule.dio);
    await gh.factoryAsync<_i4.ObjectBox>(
      () => registerModule.objectBox,
      preResolve: true,
    );
    gh.factory<_i5.RemoteLocationDatasource>(
        () => _i6.OpenMeteoRemoteLocationDatasource(dio: gh<_i3.Dio>()));
    gh.factory<_i7.RemoteWeatherForecastDatasource>(
        () => _i8.OpenMeteoRemoteWeatherForecastDatasource(dio: gh<_i3.Dio>()));
    gh.factory<_i9.WeatherThemeCubit>(() => _i9.WeatherThemeCubit());
    gh.factory<_i10.LocalAppSettingsDatasource>(() =>
        _i11.ObjectBoxLocalAppSettingsDataSource(
            objectBox: gh<_i4.ObjectBox>()));
    gh.factory<_i12.LocalLocationDatasource>(
        () => _i13.ObjectBoxLocationDatasource(objectBox: gh<_i4.ObjectBox>()));
    gh.factory<_i14.LocalWeatherForecastDataSource>(() =>
        _i15.ObjectBoxLocalWeatherForecastDatasource(
            objectBox: gh<_i4.ObjectBox>()));
    gh.factory<_i16.LocationRepository>(() => _i17.LocationRepositoryImpl(
          localLocationDatasource: gh<_i12.LocalLocationDatasource>(),
          remoteLocationDatasource: gh<_i5.RemoteLocationDatasource>(),
        ));
    gh.factory<_i18.LocationSearchCubit>(() => _i18.LocationSearchCubit(
        locationRepository: gh<_i16.LocationRepository>()));
    gh.factory<_i19.WeatherRepository>(() => _i20.WeatherRepositoryImpl(
          remoteWeatherForecastDatasource:
              gh<_i7.RemoteWeatherForecastDatasource>(),
          localWeatherForecastDataSource:
              gh<_i14.LocalWeatherForecastDataSource>(),
        ));
    gh.factory<_i21.AppSettingsRepository>(() => _i22.AppSettingsRepositoryImpl(
        localAppSettingsDatasource: gh<_i10.LocalAppSettingsDatasource>()));
    gh.factory<_i23.LocationCubit>(() =>
        _i23.LocationCubit(locationRepository: gh<_i16.LocationRepository>()));
    gh.factory<_i24.WeatherForecastCubit>(() => _i24.WeatherForecastCubit(
        weatherRepository: gh<_i19.WeatherRepository>()));
    gh.factory<_i25.AppSettingsCubit>(() => _i25.AppSettingsCubit(
        appSettingsRepository: gh<_i21.AppSettingsRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i26.RegisterModule {}
