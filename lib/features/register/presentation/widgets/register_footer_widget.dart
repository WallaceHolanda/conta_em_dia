import 'package:flutter/material.dart';

import '../../../../core/design_system/design_system.dart';

class RegisterFooterWidget extends StatelessWidget {
  const RegisterFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48),
      child: Column(
        children: [
          Center(
            child: DsText(
              DsStrings.alreadyHasAccount,
              variant: DsTextVariant.body1,
              color: DsColors.neutral60,
            ),
          ),
          const SizedBox(height: 16),
          DsSecondaryButton(
            text: DsStrings.enter,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
