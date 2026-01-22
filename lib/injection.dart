import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

import 'core/network/network_client.dart';
import 'core/network/dio_network_client.dart';
import 'core/network/dio_interceptors.dart';
import 'core/storage/secure_storage_service.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies(String environment) =>
    init(getIt, environment: environment);

@module
abstract class RegisterModule {
  @singleton
  Dio dio(SecureStorageService secureStorageService) {
    final dio = Dio();

    dio.interceptors.addAll([
      AuthInterceptor(
        dio: dio,
        storage: secureStorageService,
      ),
    ]);

    return dio;
  }

  @singleton
  NetworkClient networkClient(Dio dio) {
    return DioNetworkClient(dio);
  }
}
