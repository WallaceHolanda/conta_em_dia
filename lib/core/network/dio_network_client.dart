import 'package:dio/dio.dart';
import 'network_client.dart';

class DioNetworkClient implements NetworkClient {
  final Dio dio;

  DioNetworkClient(this.dio) {
    // Configure Dio with base options
    dio.options.baseUrl =
        'http://localhost:3000'; // Example, should be configurable
    dio.options.connectTimeout = Duration(seconds: 5);
    dio.options.receiveTimeout = Duration(seconds: 5);
  }

  @override
  Future<Response> get(String url, {Map<String, dynamic>? queryParameters}) {
    return dio.get(url, queryParameters: queryParameters);
  }

  @override
  Future<Response> post(String url, {Map<String, dynamic>? data}) {
    return dio.post(url, data: data);
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
