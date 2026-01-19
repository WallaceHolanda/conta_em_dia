import 'package:injectable/injectable.dart';
import '../../domain/repositories/secure_storage_repository.dart';
import '../datasources/i_secure_storage_datasource.dart';

@LazySingleton(as: SecureStorageRepository)
class SecureStorageRepositoryImpl implements SecureStorageRepository {
  final SecureStorageDatasource datasource;

  SecureStorageRepositoryImpl(this.datasource);

  @override
  Future<void> write(String key, String value) async {
    await datasource.write(key, value);
  }

  @override
  Future<String?> read(String key) async {
    return await datasource.read(key);
  }

  @override
  Future<void> delete(String key) async {
    await datasource.delete(key);
  }

  @override
  Future<void> deleteAll() async {
    await datasource.deleteAll();
  }
}
