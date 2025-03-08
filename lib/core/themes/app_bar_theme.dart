import 'package:flutter/material.dart';
import 'package:new_app/core/themes/colors.dart';

AppBarTheme appBarTheme = const AppBarTheme(
  backgroundColor: AppColors.appBarColor,
  foregroundColor: AppColors.primaryTextColor,
  titleTextStyle: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryTextColor,
  ),
  centerTitle: true,
);
