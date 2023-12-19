import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

Dio createDio() {
  final dio = Dio();
  final logger = Logger('Dio');
  dio.interceptors.add(LogInterceptor(
    logPrint: (object) => logger.fine(object),
  ));
  return dio;
}
