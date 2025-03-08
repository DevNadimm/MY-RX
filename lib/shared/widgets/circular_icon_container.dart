import 'package:flutter/material.dart';
import 'package:new_app/core/themes/colors.dart';

class CircularIconContainer extends StatelessWidget {
  final double size;
  final double padding;
  final String iconPath;
  final Color backgroundColor;
  final Color iconColor;

  const CircularIconContainer({
    super.key,
    required this.iconPath,
    this.size = 120,
    this.padding = 30,
    this.backgroundColor = AppColors.containerColor,
    this.iconColor = AppColors.primaryTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Image.asset(
          iconPath,
          fit: BoxFit.contain,
          color: iconColor,
        ),
      ),
    );
  }
}
