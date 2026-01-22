import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../keys/secure_storage_key.dart';
import '../secure_storage_service.dart';

@LazySingleton(as: SecureStorageService)
class FlutterSecureStorageService implements SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<void> write(SecureStorageKey key, String value) async {
    await _storage.write(key: key.keyName, value: value);
  }

  @override
  Future<String?> read(SecureStorageKey key) async {
    return await _storage.read(key: key.keyName);
  }

  @override
  Future<void> delete(SecureStorageKey key) async {
    await _storage.delete(key: key.keyName);
  }

  @override
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
