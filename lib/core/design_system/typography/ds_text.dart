import 'package:flutter/material.dart';

import 'ds_text_variant.dart';
import 'ds_typography.dart';

class DsText extends StatelessWidget {
  final String text;
  final DsTextVariant variant;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const DsText(
    this.text, {
    super.key,
    required this.variant,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: DsTypography.style(
        variant,
      ).copyWith(color: color),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
