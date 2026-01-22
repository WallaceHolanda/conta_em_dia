import 'package:injectable/injectable.dart';
import 'register_datasource.dart';

@LazySingleton(as: RegisterDataSource, env: ['mock'])
class RegisterMockDataSource implements RegisterDataSource {
  @override
  Future<void> register(String name, String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
  }
}
