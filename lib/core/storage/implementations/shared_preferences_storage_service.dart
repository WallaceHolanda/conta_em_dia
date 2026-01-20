import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../keys/local_storage_key.dart';
import '../local_storage_service.dart';

@LazySingleton(as: LocalStorageService)
class SharedPreferencesStorageService implements LocalStorageService {
  SharedPreferences? _prefs;

  Future<SharedPreferences> _getPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  @override
  Future<void> setString(LocalStorageKey key, String value) async {
    final prefs = await _getPrefs();
    await prefs.setString(key.keyName, value);
  }

  @override
  Future<String?> getString(LocalStorageKey key) async {
    final prefs = await _getPrefs();
    return prefs.getString(key.keyName);
  }

  @override
  Future<void> setBool(LocalStorageKey key, bool value) async {
    final prefs = await _getPrefs();
    await prefs.setBool(key.keyName, value);
  }

  @override
  Future<bool?> getBool(LocalStorageKey key) async {
    final prefs = await _getPrefs();
    return prefs.getBool(key.keyName);
  }

  @override
  Future<void> remove(LocalStorageKey key) async {
    final prefs = await _getPrefs();
    await prefs.remove(key.keyName);
  }

  @override
  Future<void> clear() async {
    final prefs = await _getPrefs();
    await prefs.clear();
  }
}
