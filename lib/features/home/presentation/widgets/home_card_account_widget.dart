import 'package:conta_em_dia/core/assets/ds_images_enum.dart';
import 'package:flutter/material.dart';

import '../../../../core/design_system/design_system.dart';

class HomeCardAccountWidget extends StatelessWidget {
  final String name;
  final DsImagesEnum? logo;
  final DsImagesEnum? brand;

  const HomeCardAccountWidget({
    super.key,
    required this.name,
    this.logo,
    this.brand,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 105,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DsColors.neutral60,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          logo != null
              ? DsImage(
                  height: 24,
                  width: 24,
                  path: logo!.path,
                )
              : SizedBox.shrink(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DsText(
                name,
                maxLines: 1,
                variant: DsTextVariant.body2,
                color: DsColors.neutralWhite,
              ),
              brand != null
                  ? DsImage(
                      height: 18,
                      width: 24,
                      path: brand!.path,
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
