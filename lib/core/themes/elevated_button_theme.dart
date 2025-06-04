import 'package:flutter/material.dart';
import 'package:new_app/core/themes/colors.dart';

ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: AppColors.backgroundColor,
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
);
