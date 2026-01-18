import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => message;
}

NetworkException handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return NetworkException('Connection timeout');
    case DioExceptionType.sendTimeout:
      return NetworkException('Send timeout');
    case DioExceptionType.receiveTimeout:
      return NetworkException('Receive timeout');
    case DioExceptionType.badResponse:
      if (error.response?.statusCode == 401) {
        return NetworkException('Unauthorized');
      } else if (error.response?.statusCode == 404) {
        return NetworkException('Not found');
      } else {
        return NetworkException('Bad response: ${error.response?.statusCode}');
      }
    case DioExceptionType.cancel:
      return NetworkException('Request cancelled');
    case DioExceptionType.unknown:
    default:
      return NetworkException('Unknown error: ${error.message}');
  }
}
