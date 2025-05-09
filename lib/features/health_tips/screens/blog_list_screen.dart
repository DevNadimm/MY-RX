import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/core/temp/blog_list.dart';
import 'package:new_app/features/health_tips/widgets/blog_card.dart';
import 'package:new_app/shared/widgets/app_bar_bottom_divider.dart';
import 'package:new_app/shared/widgets/app_bar_leading_arrow.dart';

class BlogListScreen extends StatefulWidget {
  const BlogListScreen({super.key});

  @override
  State<BlogListScreen> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('health_tips'.tr),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.5),
          child: AppBarBottomDivider(),
        ),
        leading: const AppBarLeadingArrow(),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: blogList.length,
        itemBuilder: (context, index) {
          final blog = blogList[index];
          return BlogCard(blog: blog);
        },
      ),
    );
  }
}
