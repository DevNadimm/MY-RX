import 'package:flutter/material.dart';
import 'package:new_app/features/medication/database/db_helper.dart';
import 'package:new_app/features/medication/models/medication_model.dart';
import 'package:new_app/features/medication/widgets/medication_card.dart';
import 'package:new_app/shared/widgets/app_bar_bottom_divider.dart';
import 'package:new_app/shared/widgets/app_bar_leading_arrow.dart';
import 'package:new_app/shared/widgets/empty_list.dart';

class ViewMedicationScreen extends StatefulWidget {
  const ViewMedicationScreen({super.key});

  @override
  State<ViewMedicationScreen> createState() => _ViewMedicationScreenState();
}

class _ViewMedicationScreenState extends State<ViewMedicationScreen> {
  List<MedicationModel> medicationList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    readMedication();
  }

  Future<void> readMedication() async {
    final meds = await DBHelper.readMedication();
    setState(() {
      medicationList = meds;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Active Medication'),
        leading: const AppBarLeadingArrow(),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.5),
          child: AppBarBottomDivider(),
        ),
      ),
      body: Visibility(
        visible: !isLoading,
        replacement: const Center(child: CircularProgressIndicator()),
        child: medicationList.isEmpty
            ? const EmptyList(title: 'No Medications Listed Yet',)
            : ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: medicationList.length,
                itemBuilder: (context, index) {
                  final medication = medicationList[index];
                  return MedicationCard(medication: medication);
                },
              ),
      ),
    );
  }
}
