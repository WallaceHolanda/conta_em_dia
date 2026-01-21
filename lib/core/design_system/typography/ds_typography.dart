import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ds_text_variant.dart';

class DSTypography {
  static TextStyle get _base => GoogleFonts.montserrat(height: 1.2);

  static TextStyle style(DSTextVariant variant) {
    switch (variant) {
      case DSTextVariant.h1:
        return _base.copyWith(fontSize: 32, fontWeight: FontWeight.w600);
      case DSTextVariant.h2:
        return _base.copyWith(fontSize: 24, fontWeight: FontWeight.w400);
      case DSTextVariant.h3:
        return _base.copyWith(fontSize: 20, fontWeight: FontWeight.w600);
      case DSTextVariant.h4:
        return _base.copyWith(fontSize: 18, fontWeight: FontWeight.w400);
      case DSTextVariant.bodyLarge:
        return _base.copyWith(fontSize: 16, fontWeight: FontWeight.w600);
      case DSTextVariant.body:
        return _base.copyWith(fontSize: 14, fontWeight: FontWeight.w500);
      case DSTextVariant.label:
        return _base.copyWith(fontSize: 14, fontWeight: FontWeight.w600);
      case DSTextVariant.button:
        return _base.copyWith(fontSize: 14, fontWeight: FontWeight.w700);
      case DSTextVariant.description:
        return _base.copyWith(fontSize: 12, fontWeight: FontWeight.w500);
    }
  }
}
