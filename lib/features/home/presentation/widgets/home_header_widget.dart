import 'package:flutter/material.dart';
import 'package:conta_em_dia/core/design_system/design_system.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/assets/ds_images_enum.dart';

class HomeHeaderWidget extends StatelessWidget {
  final String userName;

  const HomeHeaderWidget({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DsImage(
              height: 25,
              width: 28,
              path: DsImagesEnum.shortLogo.path,
            ),
            Row(
              children: [
                Icon(LucideIcons.logOut300, color: DsColors.primary),
                DsTertiaryButton(text: 'Sair', onPressed: () {}),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        DsText(
          'Boas-vindas, $userName! 👋',
          variant: DsTextVariant.h3,
          color: DsColors.neutral60,
        ),
        const SizedBox(height: 8),
        DsText(
          'Tenha seus gastos sempre sob controle, sem complicação.',
          variant: DsTextVariant.body2,
        ),
      ],
    );
  }
}
