import 'package:flutter/material.dart';

import '../ds_colors.dart';
import '../typography/typography.dart';

class DsTertiaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool enabled;

  const DsTertiaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final color = enabled ? DsColors.primary : DsColors.neutral40;

    return InkWell(
      onTap: enabled ? onPressed : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: DsText(
          text,
          textAlign: TextAlign.center,
          variant: DsTextVariant.button,
          color: color,
        ),
      ),
    );
  }
}
