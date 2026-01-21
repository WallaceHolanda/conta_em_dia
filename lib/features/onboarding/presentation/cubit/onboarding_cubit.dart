import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/onboarding_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class OnboardingCubit extends Cubit<void> {
  final OnboardingRepository repository;

  OnboardingCubit(this.repository) : super(null);

  Future<void> setOnboardingSeen() async {
    await repository.setOnboardingSeen();
  }
}
