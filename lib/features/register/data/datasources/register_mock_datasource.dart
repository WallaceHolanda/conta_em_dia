import 'package:injectable/injectable.dart';
import 'register_datasource.dart';
import '../models/user_model.dart';

@LazySingleton(as: RegisterDataSource, env: ['mock'])
class RegisterMockDataSource implements RegisterDataSource {
  @override
  Future<UserModel> register(String name, String email, String password) async {
    await Future.delayed(Duration(seconds: 1));

    return UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      name: name,
    );
  }
}
