import 'package:conta_em_dia/core/storage/secure_storage_service.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/storage/keys/secure_storage_key.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_datasource.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;
  final SecureStorageService storage;

  AuthRepositoryImpl(this.dataSource, this.storage);

  @override
  Future<void> login(String email, String password) async {
    final data = await dataSource.login(email, password);

    await storage.write(SecureStorageKey.accessToken, data.accessToken);
    await storage.write(SecureStorageKey.refreshToken, data.refreshToken);

    return;
  }
}
