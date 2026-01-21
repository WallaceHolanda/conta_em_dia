import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ds_text_variant.dart';

class DsTypography {
  static TextStyle get _base => GoogleFonts.montserrat(height: 1.2);

  static TextStyle style(DsTextVariant variant) {
    switch (variant) {
      case DsTextVariant.h1:
        return _base.copyWith(fontSize: 32, fontWeight: FontWeight.w600);
      case DsTextVariant.h2:
        return _base.copyWith(fontSize: 24, fontWeight: FontWeight.w400);
      case DsTextVariant.h3:
        return _base.copyWith(fontSize: 20, fontWeight: FontWeight.w600);
      case DsTextVariant.h4:
        return _base.copyWith(fontSize: 18, fontWeight: FontWeight.w400);
      case DsTextVariant.bodyLarge:
        return _base.copyWith(fontSize: 16, fontWeight: FontWeight.w600);
      case DsTextVariant.body:
        return _base.copyWith(fontSize: 14, fontWeight: FontWeight.w500);
      case DsTextVariant.label:
        return _base.copyWith(fontSize: 14, fontWeight: FontWeight.w600);
      case DsTextVariant.button:
        return _base.copyWith(fontSize: 14, fontWeight: FontWeight.w700);
      case DsTextVariant.description:
        return _base.copyWith(fontSize: 12, fontWeight: FontWeight.w500);
    }
  }
}
