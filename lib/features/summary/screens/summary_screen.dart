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
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.5),
          child: AppBarBottomDivider(),
        ),
        leading: const AppBarLeadingArrow(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildExpansionCard(
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
            title: 'Allergies',
            children: const [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('None Recorded'),
              ),
            ],
          ),
          _buildExpansionCard(
            title: 'Active Medications',
            children: [
              _buildMedicationItem('Apr 21, 2023', 'ADVIL 200 MG TABLET', '1 Tablet(s) Once daily x 1 Day(s)'),
              _buildMedicationItem('Nov 22, 2022', 'Mujirocin 2% Ointment', '1 Application Once daily x 1 Day(s)'),
              _buildMedicationItem('Jul 25, 2022', 'ABC', '1 g Once daily x 1 Day(s)'),
              _buildMedicationItem('Jul 21, 2022', 'TYLENOL 500 MG TABLET', '1-2 Tablet(s) Four times daily x 5 Day(s)'),
            ],
          ),
          _buildExpansionCard(
            title: 'External Medications',
            children: [
              _buildInfoRow('History of Problems', '💬️💬️'),
              _buildInfoRow('Nov 18, 2021', 'LEPTOSPIROSIS 💬️💬️'),
              _buildInfoRow('Surgical/Medical History', '💬️💬️'),
              _buildInfoRow('None Recorded', '💬️💬️'),
            ],
          ),
          _buildExpansionCard(
            title: 'Immunization Schedule',
            children: [
              _buildInfoRow('22 Yr 4 months', 'MMR, Tdap, (Men-C), Var'),
              _buildInfoRow('22 Yr 6 months', '(MMR), Pneu-C-23, Var, Inf'),
              _buildInfoRow('22 Yr 8 months', 'Td'),
              _buildInfoRow('32 Yr 4 months', 'Td'),
            ],
          ),
          _buildExpansionCard(
            title: 'Family History',
            children: const [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('None Recorded'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionCard({
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 4,
      color: AppColors.containerColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
          childrenPadding: const EdgeInsets.only(bottom: 12.0),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          trailing: const Icon(Icons.keyboard_arrow_down),
          children: children,
        ),
      ),
    );
  }

  static Widget _buildMedicationItem(String date, String name, String dosage) {
    return ListTile(
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dosage),
          Text(date, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }

  static Widget _buildInfoRow(String label, String value) {
    return ListTile(
      title: Text(label),
      trailing: Text(value, style: const TextStyle(color: Colors.grey, fontSize: 14)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }
}
