import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection.dart';
import '../cubit/onboarding_cubit.dart';
import '../pages/onboarding_page.dart';

class OnboardingRoute extends StatelessWidget {
  const OnboardingRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingCubit>(
      create: (_) => getIt<OnboardingCubit>(),
      child: const OnboardingPage(),
    );
  }
}
