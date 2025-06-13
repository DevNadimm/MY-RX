import 'package:flutter/material.dart';
import 'package:new_app/core/themes/colors.dart';
import 'package:new_app/shared/widgets/app_bar_bottom_divider.dart';
import 'package:new_app/shared/widgets/app_bar_leading_arrow.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Summary'),
        leading: const AppBarLeadingArrow(),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.5),
          child: AppBarBottomDivider(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildExpansionCard(
            icon: Icons.person,
            title: 'Profile',
            children: [
              _buildInfoRow("Patient Name", "Md. Al Mahmud Tamim"),
              _buildInfoRow("Age", "20"),
              _buildInfoRow("Blood Group", "O-"),
              _buildInfoRow("Height", "5'11\""),
              _buildInfoRow("Weight", "66 Kg"),
            ],
          ),
          _buildExpansionCard(
            icon: Icons.health_and_safety,
            title: 'Major Disease Profile',
            children: [
              _buildInfoRow('Chronic Conditions', 'None Recorded'),
              _buildInfoRow('Past Illnesses', 'None Recorded'),
            ],
          ),
          _buildExpansionCard(
            icon: Icons.warning_amber_rounded,
            title: 'Chief Complain',
            children: const [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Mild headache and occasional dizziness.'),
              ),
            ],
          ),
          _buildExpansionCard(
            icon: Icons.family_restroom,
            title: 'Family Disease',
            children: [
              _buildInfoRow('Father', 'Hypertension'),
              _buildInfoRow('Mother', 'Diabetes'),
              _buildInfoRow('Siblings', 'None Recorded'),
            ],
          ),
          _buildExpansionCard(
            icon: Icons.medical_services,
            title: 'OT History',
            children: [
              _buildInfoRow('Appendectomy', '2020'),
              _buildInfoRow('Other Surgeries', 'None Recorded'),
            ],
          ),
          _buildExpansionCard(
            icon: Icons.receipt_long,
            title: 'General Reports',
            children: [
              _buildInfoRow('Blood Test', 'Normal (2024-05-01)'),
              _buildInfoRow('Urine Test', 'Normal (2024-05-01)'),
            ],
          ),
          _buildExpansionCard(
            icon: Icons.radio_button_checked,
            title: 'Radiology Reports',
            children: [
              _buildInfoRow('X-ray Chest', 'Clear (2023-12-12)'),
              _buildInfoRow('MRI Brain', 'Normal (2023-10-20)'),
            ],
          ),
          _buildExpansionCard(
            icon: Icons.medication_rounded,
            title: 'Present Medication',
            children: [
              _buildMedicationItem('Apr 21, 2024', 'Paracetamol 500mg', '1 Tablet(s) Twice daily'),
              _buildMedicationItem('Apr 22, 2024', 'Cetirizine', '1 Tablet(s) at night'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionCard({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
          childrenPadding: const EdgeInsets.only(bottom: 12.0),
          leading: Icon(icon, color: AppColors.primaryColor),
          trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          children: children,
        ),
      ),
    );
  }

  static Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 14)),
            Text(value, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  static Widget _buildMedicationItem(String date, String name, String dosage) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(dosage),
          Text(date, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const Divider(),
        ],
      ),
    );
  }
}
