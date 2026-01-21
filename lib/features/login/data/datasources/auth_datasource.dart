import '../models/user_model.dart';

abstract class AuthDataSource {
  Future<UserModel> login(String email, String password);
}
