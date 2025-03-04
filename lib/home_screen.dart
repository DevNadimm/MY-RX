import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/core/services/localization_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isBengali = Get.locale?.languageCode == 'bn';

  void _toggleLanguage(bool value) {
    setState(() {
      isBengali = value;
      LocalizationService.changeLocale(isBengali ? 'bn' : 'en');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('hello'.tr)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('welcome'.tr, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Bengali'),
                    Switch(
                      value: isBengali,
                      onChanged: _toggleLanguage,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
