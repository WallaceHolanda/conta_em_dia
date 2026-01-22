import 'package:dio/dio.dart';

abstract class NetworkClient {
  Future<Response> get(String url, {Map<String, dynamic>? queryParameters});
  Future<Response> post(
    String url, {
    Map<String, dynamic>? data,
    Options? options,
  });
  Future<Response> put(String url, {Map<String, dynamic>? data});
  Future<Response> delete(String url);
}
