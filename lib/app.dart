import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:new_app/core/services/localization_service.dart';
import 'package:new_app/core/themes/theme.dart';
import 'package:new_app/features/dashboard/home_dashboard_screen.dart';

class MyApp extends StatelessWidget {
  final Locale locale;

  const MyApp({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MY RX',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      locale: locale,
      fallbackLocale: LocalizationService.defaultLocale,
      translations: LocalizationService(),
      home: const HomeDashboardScreen(),
    );
  }
}