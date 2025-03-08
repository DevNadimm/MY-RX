import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:new_app/core/themes/colors.dart';
import 'package:new_app/shared/widgets/app_bar_bottom_divider.dart';
import 'package:new_app/shared/widgets/circular_icon_container.dart';

class AddMedicationsScreen extends StatefulWidget {
  const AddMedicationsScreen({super.key});

  @override
  State<AddMedicationsScreen> createState() => _AddMedicationsScreenState();
}

class _AddMedicationsScreenState extends State<AddMedicationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add_medication'.tr),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.5),
          child: AppBarBottomDivider(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularIconContainer(
                iconPath: "assets/icons/medicine_reminder.png",
              ),
              const SizedBox(height: 16),
              Text(
                'medication_reminder_text'.tr,
                style: const TextStyle(
                  color: AppColors.primaryTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('add_medication'.tr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
