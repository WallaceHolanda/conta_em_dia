import '../models/login_response_model.dart';

abstract class AuthDataSource {
  Future<LoginResponseModel> login(String email, String password);
}
