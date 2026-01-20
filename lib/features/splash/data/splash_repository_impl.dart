import 'package:conta_em_dia/core/storage/local_storage_service.dart';
import 'package:injectable/injectable.dart';
import '../../../core/storage/keys/local_storage_key.dart';
import '../domain/splash_repository.dart';

@LazySingleton(as: SplashRepository)
class SplashRepositoryImpl implements SplashRepository {
  final LocalStorageService service;

  SplashRepositoryImpl(this.service);

  @override
  Future<bool> hasSeenOnboarding() async {
    return await service.getBool(LocalStorageKey.hasSeenOnboarding) ?? false;
  }
}
