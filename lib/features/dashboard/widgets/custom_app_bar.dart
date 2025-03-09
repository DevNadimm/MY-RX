import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:new_app/core/themes/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String avatar;
  final String userName;
  final VoidCallback onTap;

  const CustomAppBar({
    super.key,
    required this.avatar,
    required this.userName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: CachedNetworkImageProvider(avatar),
              fit: BoxFit.cover,
              onError: (exception, stackTrace) {},
            ),
          ),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: avatar,
              fit: BoxFit.cover,
              placeholder: (context, url) => Image.asset("assets/images/avatar.jpg"),
              errorWidget: (context, url, error) => Image.asset("assets/images/avatar.jpg"),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'hello'.tr,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                userName,
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        ClipOval(
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: onTap,
              splashColor: AppColors.primaryColor.withOpacity(0.2),
              child: const SizedBox(
                height: 50,
                width: 50,
                child: Icon(HugeIcons.strokeRoundedNotification03),
              ),
            ),
          ),
        )
      ],
    );
  }
}
