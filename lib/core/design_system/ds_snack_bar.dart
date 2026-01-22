import 'package:conta_em_dia/core/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

enum AppSnackBarType {
  success,
  error,
  warning,
}

class AppSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    required AppSnackBarType type,
  }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            _icon(type),
            color: DsColors.neutralWhite,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: DsText(
              message,
              variant: DsTextVariant.body2,
              color: DsColors.neutralWhite,
            ),
          ),
        ],
      ),
      backgroundColor: _backgroundColor(type),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static Color _backgroundColor(AppSnackBarType type) {
    switch (type) {
      case AppSnackBarType.success:
        return DsColors.success;
      case AppSnackBarType.error:
        return DsColors.error;
      case AppSnackBarType.warning:
        return DsColors.info;
    }
  }

  static IconData _icon(AppSnackBarType type) {
    switch (type) {
      case AppSnackBarType.success:
        return LucideIcons.circleCheck;
      case AppSnackBarType.error:
        return LucideIcons.circleX;
      case AppSnackBarType.warning:
        return LucideIcons.circleAlert;
    }
  }
}
