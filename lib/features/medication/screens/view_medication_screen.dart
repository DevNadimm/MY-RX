import 'package:flutter/material.dart';
import 'package:new_app/core/temp/medication_list.dart';
import 'package:new_app/features/medication/widgets/medication_card.dart';
import 'package:new_app/shared/widgets/app_bar_bottom_divider.dart';
import 'package:new_app/shared/widgets/app_bar_leading_arrow.dart';

class ViewMedicationScreen extends StatefulWidget {
  const ViewMedicationScreen({super.key});

  @override
  State<ViewMedicationScreen> createState() => _ViewMedicationScreenState();
}

class _ViewMedicationScreenState extends State<ViewMedicationScreen> {
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
      body: medications.isEmpty
          ? const Center(child: Text('No active medications'))
          : ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: medications.length,
              itemBuilder: (context, index) {
                final medication = medications[index];
                return MedicationCard(medication: medication);
              },
            ),
    );
  }
}
