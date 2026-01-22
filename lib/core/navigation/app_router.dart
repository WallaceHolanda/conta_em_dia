import 'package:flutter/material.dart';
import '../../features/home/presentation/routes/home_route.dart';
import '../../features/login/presentation/routes/login_route.dart';
import '../../features/onboarding/presentation/routes/onboarding_route.dart';
import '../../features/register_expense/presentation/routes/register_expense_route.dart';
import '../../features/splash/presentation/routes/splash_route.dart';
import '../../features/register/presentation/routes/register_route.dart';
import 'app_routes.dart';

class AppRouter {
  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.splash: (context) => const SplashRoute(),
    AppRoutes.onboarding: (context) => const OnboardingRoute(),
    AppRoutes.login: (context) => const LoginRoute(),
    AppRoutes.register: (context) => const RegisterRoute(),
    AppRoutes.home: (context) => const HomeRoute(),
    AppRoutes.registerCard: (context) => const Placeholder(),
    AppRoutes.registerExpense: (context) => const RegisterExpenseRoute(),
  };
}
