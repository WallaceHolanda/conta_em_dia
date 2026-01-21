import 'package:injectable/injectable.dart';
import 'auth_datasource.dart';
import '../models/user_model.dart';

@LazySingleton(as: AuthDataSource, env: ['mock'])
class AuthMockDataSource implements AuthDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    // Simulate API delay
    await Future.delayed(Duration(seconds: 1));

    // Mock validation
    if (email == 'test@example.com' && password == 'password') {
      return UserModel(id: '1', email: email, name: 'Test User');
    } else {
      throw Exception('Invalid credentials');
    }
  }
}
