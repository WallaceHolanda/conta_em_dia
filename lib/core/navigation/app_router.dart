import 'package:flutter/material.dart';
import '../../features/login/presentation/routes/login_route.dart';
import '../../features/onboarding/presentation/routes/onboarding_route.dart';
import '../../features/splash/presentation/routes/splash_route.dart';
import 'app_routes.dart';

class AppRouter {
  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.splash: (context) => const SplashRoute(),
    AppRoutes.onboarding: (context) => const OnboardingRoute(),
    AppRoutes.login: (context) => const LoginRoute(),
  };
}
