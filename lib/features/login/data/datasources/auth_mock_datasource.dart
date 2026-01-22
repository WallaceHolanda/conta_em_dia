import 'package:injectable/injectable.dart';
import '../models/login_response_model.dart';
import 'auth_datasource.dart';

@LazySingleton(as: AuthDataSource, env: ['mock'])
class AuthMockDataSource implements AuthDataSource {
  @override
  Future<LoginResponseModel> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));

    return LoginResponseModel(
      tokenType: "Bearer",
      accessToken: "mock_access_token",
      refreshToken: "mock_refresh_token",
    );
  }
}
