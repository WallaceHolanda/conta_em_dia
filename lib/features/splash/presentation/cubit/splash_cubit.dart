import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/splash_repository.dart';
import 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final SplashRepository repository;

  SplashCubit(this.repository) : super(SplashInitial());

  Future<void> checkRedirect() async {
    final seenOnboarding = await repository.hasSeenOnboarding();
    await Future.delayed(const Duration(seconds: 2));
    if (seenOnboarding) {
      emit(SplashToLogin());
    } else {
      emit(SplashToOnboarding());
    }
  }
}
