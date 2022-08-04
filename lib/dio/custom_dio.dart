import 'package:appcontribuinte/constants.dart';
import 'package:dio/dio.dart';

import 'custom_interceptors.dart';

class CustomDio {
  final Dio _dio = Dio();
  final bool usaToken;

  CustomDio({this.usaToken: true}) {
    _dio.interceptors.clear();
    _dio.interceptors.add(CustomInterceptors(_dio, usaToken));
    _dio.options.baseUrl = BASE_URL;
    _dio.options.connectTimeout = 50000;
  }

  Dio get dio => _dio;
}
