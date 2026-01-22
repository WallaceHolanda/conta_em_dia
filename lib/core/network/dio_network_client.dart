import 'package:dio/dio.dart';
import 'network_client.dart';

class DioNetworkClient implements NetworkClient {
  final Dio dio;

  DioNetworkClient(this.dio) {
    dio.options.baseUrl = 'http://10.0.2.2:8000';
    dio.options.connectTimeout = Duration(seconds: 5);
    dio.options.receiveTimeout = Duration(seconds: 5);
  }

  @override
  Future<Response> get(String url, {Map<String, dynamic>? queryParameters}) {
    return dio.get(url, queryParameters: queryParameters);
  }

  @override
  Future<Response> post(
    String url, {
    Map<String, dynamic>? data,
    Options? options,
  }) {
    return dio.post(url, data: data, options: options);
  }

  @override
  Future<Response> put(String url, {Map<String, dynamic>? data}) {
    return dio.put(url, data: data);
  }

  @override
  Future<Response> delete(String url) {
    return dio.delete(url);
  }
}
