import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/core/infrastructure/dio.dart';
import 'package:weather_app/features/core/infrastructure/object_box.dart';

import 'services.config.dart';

final getIt = GetIt.instance;

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => createDio();

  @preResolve
  Future<ObjectBox> get objectBox => ObjectBox.create();
}

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();
