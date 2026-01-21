import 'package:flutter/material.dart';

import '../ds_colors.dart';
import '../typography/typography.dart';

class DsSecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool enabled;

  const DsSecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: enabled ? onPressed : null,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: enabled ? DsColors.primary : DsColors.neutral40,
            width: 2,
          ),
          foregroundColor: enabled ? DsColors.primary : DsColors.neutral40,
          disabledForegroundColor: DsColors.neutral30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        child: DsText(
          text,
          textAlign: TextAlign.center,
          variant: DsTextVariant.button,
          color: enabled ? DsColors.primary : DsColors.neutral40,
        ),
      ),
    );
  }
}
