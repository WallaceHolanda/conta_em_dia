import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../../core/design_system/design_system.dart';

class HomeEmptyCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onPressed;

  const HomeEmptyCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DsColors.neutralWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: DsColors.neutral10,
              shape: BoxShape.circle,
            ),
            child: Icon(
              LucideIcons.circleX,
              color: DsColors.info,
              size: 28,
            ),
          ),
          const SizedBox(height: 12),
          DsText(
            title,
            variant: DsTextVariant.body1,
            color: DsColors.neutral60,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          DsText(
            subtitle,
            variant: DsTextVariant.body2,
            color: DsColors.neutral60,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          DsPrimaryButton(
            text: buttonText,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
