import 'package:flutter/material.dart';
import 'app_routes.dart';

class AppNavigator {
  static void goToLogin(BuildContext context, {Object? arguments}) {
    Navigator.of(
      context,
    ).pushReplacementNamed(AppRoutes.login, arguments: arguments);
  }

  static void goToRegister(BuildContext context, {Object? arguments}) {
    Navigator.of(
      context,
    ).pushReplacementNamed(AppRoutes.register, arguments: arguments);
  }

  static void goToHome(BuildContext context, {Object? arguments}) {
    Navigator.of(
      context,
    ).pushReplacementNamed(AppRoutes.home, arguments: arguments);
  }

  static void goToRegisterCard(BuildContext context, {Object? arguments}) {
    Navigator.of(
      context,
    ).pushNamed(AppRoutes.registerCard, arguments: arguments);
  }

  static void goToRegisterExpense(BuildContext context, {Object? arguments}) {
    Navigator.of(
      context,
    ).pushNamed(AppRoutes.registerExpense, arguments: arguments);
  }

  static void goBackToHome(
    BuildContext context, {
    Object? arguments,
  }) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.home,
      (route) => false,
      arguments: arguments,
    );
  }
}
