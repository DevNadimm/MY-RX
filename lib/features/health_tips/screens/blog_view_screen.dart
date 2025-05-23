import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/temp/blog_list.dart';
import 'package:new_app/shared/widgets/app_bar_bottom_divider.dart';
import 'package:new_app/shared/widgets/app_bar_leading_arrow.dart';

class BlogViewScreen extends StatelessWidget {
  final BlogContent blog;

  const BlogViewScreen({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Details'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.5),
          child: AppBarBottomDivider(),
        ),
        leading: const AppBarLeadingArrow(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 🔥 Stylish Image Section with Overlay
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: CachedNetworkImage(
                    imageUrl: blog.bannerImage,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.broken_image, size: 100),
                    ),
                  ),
                ),
              ),
              // Gradient Overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              // Title Overlay
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: Text(
                  blog.title,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      const Shadow(
                        color: Colors.black45,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          //const SizedBox(height: 24),

          // Author + Date Card
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.person, color: Colors.grey[700], size: 18),
                const SizedBox(width: 6),
                Text(blog.author, style: theme.textTheme.bodyMedium),
                const Spacer(),
                Icon(Icons.calendar_today, color: Colors.grey[700], size: 18),
                const SizedBox(width: 6),
                Text(blog.date, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 📝 Blog Content
          Text(
            blog.content,
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.5
            )
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
