import 'package:flutter/cupertino.dart';

class FeatureModel {
  final String label;
  final String shortDescription;
  final Color color;
  final String iconPath;
  final VoidCallback onTap;

  FeatureModel({
    required this.label,
    required this.shortDescription,
    required this.color,
    required this.iconPath,
    required this.onTap
  });
}
