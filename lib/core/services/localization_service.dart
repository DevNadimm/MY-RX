import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationService extends Translations {
  static const String keyLanguage = 'language_code';
  static final currentLocale = Get.locale;


  static final List<Locale> locales = [
    const Locale('en', 'US'),
    const Locale('bn', 'BD'),
  ];

  static Locale get defaultLocale => const Locale('en', 'US');

  static Future<Locale> getSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    String? langCode = prefs.getString(keyLanguage);
    if (langCode == null) return defaultLocale;
    return locales.firstWhere((locale) => locale.languageCode == langCode, orElse: () => defaultLocale);
  }

  static Future<void> changeLocale(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyLanguage, langCode);
    Get.updateLocale(Locale(langCode));
  }

  @override
  Map<String, Map<String, String>> get keys => {};

  static Future<void> loadTranslations() async {
    for (Locale locale in locales) {
      String jsonString = await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      Map<String, String> localizedStrings =
      jsonMap.map((key, value) => MapEntry(key, value.toString()));

      Get.locale?.languageCode == locale.languageCode
          ? Get.updateLocale(locale)
          : null;

      Get.addTranslations({locale.languageCode: localizedStrings});
    }
  }
}
