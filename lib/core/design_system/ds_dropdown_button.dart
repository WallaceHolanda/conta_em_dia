import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'ds_colors.dart';

class DsDropdownButton<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final String textHint;
  final String textLabel;
  final bool isLoading;
  final bool isExpanded;
  final Function(T?)? onChanged;
  final String? Function(T?)? validator;

  const DsDropdownButton({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
    required this.textHint,
    required this.textLabel,
    this.isLoading = false,
    this.isExpanded = true,
    this.alignment,
    this.padding,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2<T>(
        value: value,
        items: items,
        isExpanded: isExpanded,
        validator: validator,
        onChanged: isLoading ? null : onChanged,
        alignment: alignment ?? Alignment.centerLeft,
        hint: Text(
          textHint,
          overflow: TextOverflow.ellipsis,
        ),
        barrierLabel: 'teste',
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(
            left: 6,
          ),
          width: double.maxFinite,
        ),
        iconStyleData: IconStyleData(
          icon: Padding(
            padding: const EdgeInsets.only(
              right: 16,
            ),
            child: isLoading
                ? const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      color: DsColors.primary,
                      strokeWidth: 2,
                    ),
                  )
                : Icon(
                    LucideIcons.chevronDown,
                    color: DsColors.neutral60,
                    size: 18,
                  ),
          ),
          iconSize: 16,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
          ),
        ),
      ),
    );
  }
}
