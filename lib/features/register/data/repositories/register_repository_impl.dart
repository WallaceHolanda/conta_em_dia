import 'package:injectable/injectable.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/register_repository.dart';
import '../datasources/register_datasource.dart';

@LazySingleton(as: RegisterRepository)
class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDataSource dataSource;

  RegisterRepositoryImpl(this.dataSource);

  @override
  Future<User> register(String name, String email, String password) async {
    final userModel = await dataSource.register(name, email, password);
    return userModel;
  }
}
