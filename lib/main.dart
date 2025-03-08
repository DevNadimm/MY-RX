import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/core/services/localization_service.dart';
import 'package:new_app/core/themes/theme.dart';
import 'package:new_app/features/medication/screens/add_medications_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Locale locale = await LocalizationService.getSavedLocale();
  await LocalizationService.loadTranslations();

  runApp(MyApp(locale: locale));
}

class MyApp extends StatelessWidget {
  final Locale locale;

  const MyApp({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MY RX',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: appTheme,
      locale: locale,
      fallbackLocale: LocalizationService.defaultLocale,
      translations: LocalizationService(),
      home: const AddMedicationsScreen(),
    );
  }
}
