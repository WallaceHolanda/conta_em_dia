import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/splash_repository.dart';

enum SplashRedirect { login, onboarding }

class SplashCubit extends Cubit<SplashRedirect?> {
  final SplashRepository repository;

  SplashCubit(this.repository) : super(null);

  Future<void> checkRedirect() async {
    final seenOnboarding = await repository.hasSeenOnboarding();
    await Future.delayed(const Duration(seconds: 2));
    if (seenOnboarding) {
      emit(SplashRedirect.login);
    } else {
      emit(SplashRedirect.onboarding);
    }
  }
}
