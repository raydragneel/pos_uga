import 'package:dio/dio.dart';
import 'package:pos_uga/static_data.dart';

abstract class DioService {
  static Dio init() {
    Dio dio = new Dio();
    dio.options.baseUrl = StaticData.baseUrl;
    dio.options.connectTimeout = 15000;
    dio.options.receiveTimeout = 3000;
    dio.options.validateStatus = (_) => true;
    dio.options.responseType = ResponseType.json;
    return dio;
  }

  static Dio google() {
    Dio dio = new Dio();
    dio.options.baseUrl = "https://google.com";
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    dio.options.validateStatus = (_) => true;
    return dio;
  }
}
