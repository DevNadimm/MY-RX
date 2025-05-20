import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:new_app/core/services/localization_service.dart';
import 'package:new_app/core/themes/theme.dart';
import 'package:new_app/features/auth/screens/splash_screen.dart';
import 'package:toastification/toastification.dart';

class MyApp extends StatelessWidget {
  final Locale locale;

  const MyApp({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp(
        title: 'MY RX',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        locale: locale,
        fallbackLocale: LocalizationService.defaultLocale,
        translations: LocalizationService(),
        home: const SplashScreen(),
      ),
    );
  }
}