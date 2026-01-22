import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import '../../../../core/network/network_client.dart';
import '../../../../core/network/network_exceptions.dart';
import '../models/home_model.dart';
import 'home_datasource.dart';

@LazySingleton(as: HomeDataSource, env: ['dev'])
class HomeRemoteDataSource implements HomeDataSource {
  final NetworkClient networkClient;

  HomeRemoteDataSource(this.networkClient);

  @override
  Future<HomeModel> getHomeItems() async {
    try {
      final response = await networkClient.get('/home');

      if (response.statusCode == 200) {
        return HomeModel.fromJson(response.data);
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
