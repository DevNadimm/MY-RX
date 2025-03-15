import 'package:flutter/material.dart';
import 'package:new_app/core/utils/constant_list.dart';
import 'package:new_app/features/dashboard/widgets/custom_app_bar.dart';
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
              height: 170,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  FeatureModel feature = ConstantList.featureList[index];
                  return Container(
                    height: 170,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            color: feature.color.withOpacity(0.2),
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.asset(feature.iconPath, scale: 8),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(feature.label,maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyLarge,),
                          const SizedBox(height: 10),
                          Text(feature.shortDescription, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium,)
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
