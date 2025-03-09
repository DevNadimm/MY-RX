import 'package:flutter/material.dart';
import 'package:new_app/features/dashboard/widgets/custom_app_bar.dart';

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({super.key});

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(
          avatar: 'https://shorturl.at/Gg04h',
          userName: 'Nadim Chowdhury',
          onTap: () {},
        ),
      ),
    );
  }
}
