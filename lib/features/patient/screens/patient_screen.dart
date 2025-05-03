import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/core/themes/colors.dart';
import 'package:new_app/features/patient/screens/add_patient_screen.dart';
import 'package:new_app/features/patient/screens/view_patient_screen.dart';
import 'package:new_app/shared/widgets/app_bar_bottom_divider.dart';
import 'package:new_app/shared/widgets/app_bar_leading_arrow.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('patient'.tr),
        leading: const AppBarLeadingArrow(),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.5),
          child: AppBarBottomDivider(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'manage_patients'.tr,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 30),
            _buildOptionCard(
              context,
              title: 'add_patient'.tr,
              subtitle: 'add_patient_desc'.tr,
              icon: Icons.person_add_alt_1,
              onTap: () {
                Get.to(() => const AddPatientScreen());
              },
            ),
            const SizedBox(height: 20),
            _buildOptionCard(
              context,
              title: 'view_patient'.tr,
              subtitle: 'view_patient_desc'.tr,
              icon: Icons.person_search,
              onTap: () {
                Get.to(() => const ViewPatientScreen());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(16),
      color: AppColors.containerColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryColor,
                      AppColors.primaryColor.withValues(alpha: 0.6)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Icon(icon, size: 30, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
