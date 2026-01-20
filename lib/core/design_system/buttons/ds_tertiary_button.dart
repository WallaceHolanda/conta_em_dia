import 'package:flutter/material.dart';

import '../ds_colors.dart';

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
    return TextButton(
      onPressed: enabled ? onPressed : null,
      style: TextButton.styleFrom(
        foregroundColor: enabled ? DsColors.primary : DsColors.neutral40,
        disabledForegroundColor: DsColors.neutral30,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
      child: Text(text),
    );
  }
}
