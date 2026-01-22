import 'keys/secure_storage_key.dart';

abstract class SecureStorageService {
  Future<void> write(SecureStorageKey key, String value);
  Future<String?> read(SecureStorageKey key);
  Future<void> delete(SecureStorageKey key);
  Future<void> deleteAll();
}
