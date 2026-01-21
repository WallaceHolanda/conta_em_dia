import '../entities/user.dart';

abstract class RegisterRepository {
  Future<User> register(String name, String email, String password);
}
