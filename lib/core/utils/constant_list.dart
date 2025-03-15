import 'package:flutter/material.dart';
import 'package:new_app/shared/models/feature_model.dart';

class ConstantList {
  ConstantList._();

  static List<String> drugList = [
    "Tablet",
    "Capsule",
    "Syrup",
    "Injection",
    "Ointment",
    "Drops",
    "Powder",
    "Gel",
    "Cream",
    "Spray",
    "Vaccine"
  ];

  static List<FeatureModel> featureList = [
    FeatureModel(
      label: "Patient",
      shortDescription: "Manage patient records efficiently.",
      color: Colors.green,
      iconPath: "assets/icons/patient.png",
    ),
    FeatureModel(
      label: "Medication",
      shortDescription: "Track and organize medications easily.",
      color: Colors.blue,
      iconPath: "assets/icons/medication.png",
    ),
    FeatureModel(
      label: "Summary",
      shortDescription: "Get a quick health report overview.",
      color: Colors.deepOrange,
      iconPath: "assets/icons/summery.png",
    ),
    FeatureModel(
      label: "Health Tips",
      shortDescription: "Daily tips for a healthier lifestyle.",
      color: Colors.purple,
      iconPath: "assets/icons/tips.png",
    ),
  ];
}
