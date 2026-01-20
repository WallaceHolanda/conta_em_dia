import 'keys/local_storage_key.dart';

abstract class LocalStorageService {
  Future<void> setString(LocalStorageKey key, String value);
  Future<String?> getString(LocalStorageKey key);
  Future<void> setBool(LocalStorageKey key, bool value);
  Future<bool?> getBool(LocalStorageKey key);
  Future<void> remove(LocalStorageKey key);
  Future<void> clear();
}
