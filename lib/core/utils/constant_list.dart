import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/features/health_tips/screens/blog_list_screen.dart';
import 'package:new_app/features/medication/screens/medication_screen.dart';
import 'package:new_app/features/patient/screens/patient_screen.dart';
import 'package:new_app/features/summary/screens/summary_screen.dart';
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
      label: 'feature_patient_label',
      shortDescription: 'feature_patient_description',
      color: Colors.green,
      iconPath: "assets/icons/patient.png",
      onTap: () {
        Get.to(() => const PatientScreen());
      },
    ),
    FeatureModel(
      label: 'feature_summary_label',
      shortDescription: 'feature_summary_description',
      color: Colors.deepOrange,
      iconPath: "assets/icons/summery.png",
      onTap: () {
        Get.to(() => const SummaryScreen());
      },
    ),
    FeatureModel(
      label: 'feature_medication_label',
      shortDescription: 'feature_medication_description',
      color: Colors.blue,
      iconPath: "assets/icons/medication.png",
      onTap: () {
        Get.to(() => const MedicationScreen());
      },
    ),
    FeatureModel(
      label: 'feature_health_tips_label',
      shortDescription: 'feature_health_tips_description',
      color: Colors.purple,
      iconPath: "assets/icons/tips.png",
      onTap: () {
        Get.to(() => const BlogListScreen());
      },
    ),
  ];
}
