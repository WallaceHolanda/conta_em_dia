import 'package:injectable/injectable.dart';
import '../../../core/storage/keys/local_storage_key.dart';
import '../../../core/storage/local_storage_service.dart';
import '../domain/onboarding_repository.dart';

@LazySingleton(as: OnboardingRepository)
class OnboardingRepositoryImpl implements OnboardingRepository {
  final LocalStorageService service;

  OnboardingRepositoryImpl(this.service);

  @override
  Future<void> setOnboardingSeen() async {
    await service.setBool(LocalStorageKey.hasSeenOnboarding, true);
  }
}
