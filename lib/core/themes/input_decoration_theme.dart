import 'package:flutter/material.dart';
import 'package:new_app/core/themes/colors.dart';

InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
  errorMaxLines: 3,
  prefixIconColor: AppColors.secondaryTextColor,
  suffixIconColor: AppColors.secondaryTextColor,
  labelStyle: const TextStyle().copyWith(fontSize: 14, color: AppColors.secondaryTextColor),
  hintStyle: const TextStyle().copyWith(fontSize: 14, color: AppColors.secondaryTextColor),
  errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
  floatingLabelStyle: const TextStyle().copyWith(
    color: Colors.black.withOpacity(0.8),
  ),
  border: const OutlineInputBorder().copyWith(
    borderRadius: BorderRadius.circular(14),
    borderSide: const BorderSide(width: 1, color: AppColors.inputBorderDefault),
  ),
  enabledBorder: const OutlineInputBorder().copyWith(
    borderRadius: BorderRadius.circular(14),
    borderSide: const BorderSide(width: 1, color: AppColors.inputBorderDefault),
  ),
  focusedBorder: const OutlineInputBorder().copyWith(
    borderRadius: BorderRadius.circular(14),
    borderSide: const BorderSide(width: 1.5, color: AppColors.inputBorderFocused),
  ),
  errorBorder: const OutlineInputBorder().copyWith(
    borderRadius: BorderRadius.circular(14),
    borderSide: const BorderSide(width: 1, color: Colors.red),
  ),
  focusedErrorBorder: const OutlineInputBorder().copyWith(
    borderRadius: BorderRadius.circular(14),
    borderSide: const BorderSide(width: 2, color: Colors.orange),
  ),
);
