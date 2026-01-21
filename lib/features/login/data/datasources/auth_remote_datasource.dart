import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'auth_datasource.dart';
import '../../../../core/network/network_client.dart';
import '../../../../core/network/network_exceptions.dart';
import '../models/user_model.dart';

@LazySingleton(as: AuthDataSource, env: ['dev'])
class AuthRemoteDataSource implements AuthDataSource {
  final NetworkClient networkClient;

  AuthRemoteDataSource(this.networkClient);

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await networkClient.post(
        '/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw NetworkException(
          'Login failed with status: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      throw NetworkException('Unexpected error: $e');
    }
  }
}
