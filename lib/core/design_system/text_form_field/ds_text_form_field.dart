import 'package:conta_em_dia/core/design_system/ds_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../typography/typography.dart';

class DsTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final int? maxLength;
  final bool enabled;
  final bool obscureText;

  const DsTextFormField({
    super.key,
    required this.controller,
    required this.keyboardType,
    this.focusNode,
    this.readOnly = false,
    this.labelText,
    this.hintText,
    this.validator,
    this.inputFormatters,
    this.onTapOutside,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.enabled = true,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onTap: onTap,
      onTapOutside: onTapOutside,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
      readOnly: readOnly,
      maxLength: maxLength,
      obscureText: obscureText,
      style: DsTypography.style(DsTextVariant.label).copyWith(
        color: enabled ? DsColors.neutral60 : DsColors.neutral40,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: DsTypography.style(DsTextVariant.label).copyWith(
          color: enabled ? DsColors.neutral60 : DsColors.neutral40,
        ),
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        counterText: '',
        errorMaxLines: 3,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: enabled ? DsColors.neutral40 : DsColors.neutral50,
            width: 1,
          ),
        ),
      ),
    );
  }
}
