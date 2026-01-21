import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/assets/ds_images_enum.dart';
import '../../../../core/design_system/design_system.dart';

class RegisterHeaderWidget extends StatelessWidget {
  const RegisterHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              LucideIcons.chevronLeft,
              color: DsColors.primary,
            ),
            DsImage(
              height: 25,
              width: 150,
              path: DsImagesEnum.logo.path,
            ),
          ],
        ),
        const SizedBox(height: 48),
        DsText(
          DsStrings.registerTitle,
          variant: DsTextVariant.h3,
          color: DsColors.neutral60,
        ),
        const SizedBox(height: 8),
        DsText(
          DsStrings.registerSubTitle,
          variant: DsTextVariant.body2,
          color: DsColors.neutral60,
        ),
      ],
    );
  }
}
