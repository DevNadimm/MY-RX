import 'package:flutter/material.dart';
import 'package:new_app/app.dart';
import 'package:new_app/core/services/localization_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Locale locale = await LocalizationService.getSavedLocale();
  await LocalizationService.loadTranslations();

  runApp(MyApp(locale: locale));
}
