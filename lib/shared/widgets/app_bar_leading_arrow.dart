import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class AppBarLeadingArrow extends StatelessWidget {
  const AppBarLeadingArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(HugeIcons.strokeRoundedArrowLeft02),
    );
  }
}
