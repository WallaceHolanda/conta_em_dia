import 'package:conta_em_dia/core/storage/keys/secure_storage_key.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../storage/secure_storage_service.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final SecureStorageService storage;

  AuthInterceptor({
    required this.dio,
    required this.storage,
  });

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    final token = await storage.read(SecureStorageKey.accessToken);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    debugPrint(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    if (err.response?.statusCode == 401) {
      final refreshToken = await storage.read(SecureStorageKey.refreshToken);

      if (refreshToken == null) {
        handler.next(err);
        return;
      }

      try {
        final response = await dio.post(
          '/refresh',
          data: {'refresh_token': refreshToken},
        );

        final newAccessToken = response.data['access_token'];
        final newRefreshToken = response.data['refresh_token'];

        await storage.write(SecureStorageKey.accessToken, newAccessToken);
        await storage.write(SecureStorageKey.refreshToken, newRefreshToken);

        final requestOptions = err.requestOptions;
        requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

        final clonedResponse = await dio.fetch(requestOptions);
        handler.resolve(clonedResponse);
        return;
      } catch (_) {
        await storage.deleteAll();
      }
    }

    handler.next(err);
  }
}
