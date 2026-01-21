import '../models/user_model.dart';

abstract class RegisterDataSource {
  Future<UserModel> register(String name, String email, String password);
}
