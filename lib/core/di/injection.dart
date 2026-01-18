import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import '../network/network_client.dart';
import '../network/dio_network_client.dart';
import '../network/dio_interceptors.dart';
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
  Dio get dio {
    final dio = Dio();
    dio.interceptors.addAll([
      AuthInterceptor(() async => 'mock-token'),
      LoggingInterceptor(),
    ]);
    return dio;
  }

  @singleton
  NetworkClient get networkClient => DioNetworkClient(dio);
}
