import 'package:flutter/material.dart';

import '../ds_colors.dart';

class DsPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool enabled;

  const DsPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: enabled ? DsColors.primary : DsColors.neutral40,
          foregroundColor: Colors.white,
          disabledBackgroundColor: DsColors.neutral10,
          disabledForegroundColor: DsColors.neutral30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
