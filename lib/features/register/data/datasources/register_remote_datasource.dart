import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'register_datasource.dart';
import '../../../../core/network/network_client.dart';
import '../../../../core/network/network_exceptions.dart';

@LazySingleton(as: RegisterDataSource, env: ['dev'])
class RegisterRemoteDataSource implements RegisterDataSource {
  final NetworkClient networkClient;

  RegisterRemoteDataSource(this.networkClient);

  @override
  Future<void> register(String name, String email, String password) async {
    try {
      final response = await networkClient.post(
        '/register',
        data: {'name': name, 'email': email, 'password': password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return;
      } else {
        throw NetworkException(
          'Register failed with status: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      throw NetworkException('Unexpected error: $e');
    }
  }
}
