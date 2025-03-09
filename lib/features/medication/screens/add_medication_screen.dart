import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:new_app/shared/widgets/app_bar_bottom_divider.dart';
import 'package:new_app/shared/widgets/custom_bottom_sheet.dart';

class AddMedicationScreen extends StatefulWidget {
  const AddMedicationScreen({super.key});

  @override
  State<AddMedicationScreen> createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  TextEditingController medicationName = TextEditingController();
  final TextEditingController drugType = TextEditingController();
  List<String> drugList = [
    "Inhaled",
    "Tablet",
    "Capsule",
    "Syrup",
    "Injection",
    "Ointment",
    "Drops",
    "Powder",
    "Suppository",
    "Patch",
    "Gel",
    "Lozenge",
    "Nasal Spray",
    "Ear Drops",
    "Eye Drops",
    "Chewable Tablet",
    "Liquid",
    "Cream",
    "Solution",
    "Suspension",
    "Pill",
    "Vaccine",
    "Spray"
  ];

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Medication description or nickname",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                controller: medicationName,
                decoration: const InputDecoration(
                  hintText: "Type here...",
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Drug Type",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                controller: drugType,
                decoration: const InputDecoration(
                  hintText: "Select",
                ),
                readOnly: true,
                onTap: () {
                  showCustomBottomSheet(
                      items: drugList,
                      controller: drugType,
                      title: 'Select Drug',
                      isSearchable: true
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showCustomBottomSheet({
    required List<String> items,
    required TextEditingController controller,
    required String title,
    bool isSearchable = false,
  }) async {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return CustomBottomSheetContent(
              items: items,
              controller: controller,
              title: title,
              onItemSelected: (item) {
                setState(() {
                  controller.text = item;
                });
                Navigator.pop(context);
              },
              isSearchable: isSearchable,
            );
          },
        );
      },
    );
  }
}
