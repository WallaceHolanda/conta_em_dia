import 'package:flutter/material.dart';
import 'package:conta_em_dia/core/design_system/design_system.dart';

class HomeCurrentSpendCard extends StatelessWidget {
  final double value;
  final String month;

  const HomeCurrentSpendCard({
    super.key,
    required this.value,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: DsColors.neutralWhite,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DsText(
            month,
            variant: DsTextVariant.body1,
            color: DsColors.neutral60,
          ),
          const SizedBox(height: 16),
          DsText(
            'Minhas despesas',
            variant: DsTextVariant.body2,
            color: DsColors.neutral60,
          ),
          const SizedBox(height: 8),
          DsText(
            'R\$ ${value.toStringAsFixed(2)}',
            variant: DsTextVariant.h1,
            color: DsColors.neutral60,
          ),
        ],
      ),
    );
  }
}
