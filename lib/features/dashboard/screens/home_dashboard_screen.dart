import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:new_app/core/temp/blog_list.dart';
import 'package:new_app/core/utils/constant_list.dart';
import 'package:new_app/features/dashboard/widgets/blog_container.dart';
import 'package:new_app/features/dashboard/widgets/custom_app_bar.dart';
import 'package:new_app/features/dashboard/widgets/feature_container.dart';
import 'package:new_app/features/dashboard/widgets/image_fade_carousel.dart';
import 'package:new_app/shared/models/feature_model.dart';
import 'package:new_app/shared/widgets/section_header.dart';

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
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: SizedBox(height: 10),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: ImageFadeCarousel(),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'features'.tr,
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
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    FeatureModel feature = ConstantList.featureList[index];
                    return FeatureContainer(
                      feature: feature,
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SectionHeader(
                  title: 'recent_blog'.tr,
                  onSeeMoreTap: (){
                    /// Navigate to blog section
                  },
                ),
              ),
              const SizedBox(height: 2),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  final BlogContent bolg = blogList[index];
                  return BlogContainer(blog: bolg);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
