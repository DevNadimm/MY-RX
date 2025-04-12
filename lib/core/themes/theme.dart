import 'package:flutter/material.dart';
import 'package:new_app/core/themes/app_bar_theme.dart';
import 'package:new_app/core/themes/colors.dart';
import 'package:new_app/core/themes/elevated_button_theme.dart';
import 'package:new_app/core/themes/input_decoration_theme.dart';
import 'package:new_app/core/themes/text_selection_theme.dart';
import 'package:new_app/core/themes/text_theme.dart';

ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  appBarTheme: appBarTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  textTheme: textTheme,
  inputDecorationTheme: inputDecorationTheme,
  textSelectionTheme: textSelectionTheme,
);
