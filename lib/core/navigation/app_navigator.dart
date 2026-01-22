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
}
