import 'package:flutter/material.dart';
import 'app_routes.dart';

class AppNavigator {
  static void goToLogin(BuildContext context, {Object? arguments}) {
    Navigator.of(
      context,
    ).pushReplacementNamed(AppRoutes.login, arguments: arguments);
  }

  static void goToDashboard(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.onboarding);
  }
}
