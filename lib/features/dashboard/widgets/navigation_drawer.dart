import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:new_app/core/services/localization_service.dart';
import 'package:new_app/features/medication/services/notification_service.dart';

class CustomNavigationDrawer extends StatefulWidget {
  const CustomNavigationDrawer({super.key});

  @override
  State<CustomNavigationDrawer> createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  bool isBengali = Get.locale?.languageCode == 'bn';

  void _toggleLanguage(bool value) {
    setState(() {
      isBengali = value;
      LocalizationService.changeLocale(isBengali ? 'bn' : 'en');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Nadim Chowdhury'),
            accountEmail: const Text('nadimchowdhury87@gmail.com'),
            currentAccountPicture: const CircleAvatar(
                backgroundImage:
                    CachedNetworkImageProvider('https://shorturl.at/Gg04h')),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            leading: const Icon(HugeIcons.strokeRoundedLanguageSquare),
            title: const Text('Language (Bengali)'),
            trailing: Switch(
              value: isBengali,
              onChanged: (val) {
                _toggleLanguage(val);
                NotificationService().sendNotification(
                  "🌍 You're all set!",
                  val
                      ? "The app is now in Bengali 🇧🇩 — শুভ দিন!"
                      : "The app is now in English 🇬🇧 — Have a great day!",
                );
              },
            ),
            onTap: () {
              final newLang = !isBengali;
              _toggleLanguage(newLang);
              NotificationService().sendNotification(
                "🌍 You're all set!",
                newLang
                    ? "The app is now in Bengali 🇧🇩 — শুভ দিন!"
                    : "The app is now in English 🇬🇧 — Have a great day!",
              );
            },
          ),
          ListTile(
            leading: const Icon(HugeIcons.strokeRoundedUserGroup),
            title: const Text('About Us'),
            onTap: () {
              // Handle about us
            },
          ),
          ListTile(
            leading: const Icon(HugeIcons.strokeRoundedAccountSetting03),
            title: const Text('Settings'),
            onTap: () {
              // Handle settings
            },
          ),
          ListTile(
            leading: const Icon(HugeIcons.strokeRoundedHelpSquare),
            title: const Text('Help & Support'),
            onTap: () {
              // Handle help & support
            },
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () async {},
                icon: const Icon(
                  HugeIcons.strokeRoundedLogout03,
                  color: Colors.white,
                ),
                label: const Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
