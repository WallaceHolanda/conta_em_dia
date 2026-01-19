import 'package:injectable/injectable.dart';
import '../../domain/repositories/shared_preferences_repository.dart';
import '../datasources/i_shared_preferences_datasource.dart';

@LazySingleton(as: SharedPreferencesRepository)
class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  final SharedPreferencesDatasource datasource;

  SharedPreferencesRepositoryImpl(this.datasource);

  @override
  Future<void> setString(String key, String value) async {
    await datasource.setString(key, value);
  }

  @override
  Future<String?> getString(String key) async {
    return await datasource.getString(key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await datasource.setBool(key, value);
  }

  @override
  Future<bool?> getBool(String key) async {
    return await datasource.getBool(key);
  }

  @override
  Future<void> remove(String key) async {
    await datasource.remove(key);
  }

  @override
  Future<void> clear() async {
    await datasource.clear();
  }
}
