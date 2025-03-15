import 'package:flutter/material.dart';
import 'package:new_app/core/utils/constant_list.dart';
import 'package:new_app/features/dashboard/widgets/custom_app_bar.dart';
import 'package:new_app/features/dashboard/widgets/feature_container.dart';
import 'package:new_app/shared/models/feature_model.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Features",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  FeatureModel feature = ConstantList.featureList[index];
                  return FeatureContainer(feature: feature,);
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
