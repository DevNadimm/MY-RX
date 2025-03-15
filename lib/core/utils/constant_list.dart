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
      label: 'feature_patient_label',
      shortDescription: 'feature_patient_description',
      color: Colors.green,
      iconPath: "assets/icons/patient.png",
    ),
    FeatureModel(
      label: 'feature_medication_label',
      shortDescription: 'feature_medication_description',
      color: Colors.blue,
      iconPath: "assets/icons/medication.png",
    ),
    FeatureModel(
      label: 'feature_summary_label',
      shortDescription: 'feature_summary_description',
      color: Colors.deepOrange,
      iconPath: "assets/icons/summery.png",
    ),
    FeatureModel(
      label: 'feature_health_tips_label',
      shortDescription: 'feature_health_tips_description',
      color: Colors.purple,
      iconPath: "assets/icons/tips.png",
    ),
  ];
}
