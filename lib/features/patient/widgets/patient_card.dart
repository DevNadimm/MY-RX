import 'package:flutter/material.dart';
import 'package:new_app/core/themes/colors.dart';
import 'package:new_app/features/patient/models/patient_model.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;

  const PatientCard({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      color: AppColors.containerColor,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              patient.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              patient.email,
              style: TextStyle(color: Colors.grey[700]),
            ),

            const SizedBox(height: 12),
            const Divider(),

            // Sections
            _buildSectionTitle("Contact Info"),
            _buildInfoRow(Icons.phone, "Contact", patient.contactNo),
            _buildInfoRow(Icons.chat, "WhatsApp", patient.whatsappNo),
            _buildInfoRow(Icons.location_on, "Address", patient.address),

            const SizedBox(height: 12),
            const Divider(),

            _buildSectionTitle("Physical Info"),
            _buildInfoRow(Icons.height, "Height", patient.height),
            _buildInfoRow(Icons.monitor_weight, "Weight", patient.weight),
            _buildInfoRow(Icons.bloodtype, "Blood Group", patient.bloodGroup),

            // const SizedBox(height: 12),
            // const Divider(),
            //
            // _buildSectionTitle("Medical Info"),
            // _buildInfoRow(Icons.warning, "Chief Complain", patient.chiefComplain),
            // _buildInfoRow(Icons.family_restroom, "Family Disease", patient.familyDisease),
            // _buildInfoRow(Icons.history, "OT History", patient.otHistory),
            // _buildInfoRow(Icons.medication, "Present Medication", patient.presentMedication),
            // _buildInfoRow(Icons.local_hospital, "Diagnosis", patient.commonDiagnosis),
            // _buildInfoRow(Icons.vaccines, "Vaccines", patient.vaccineRecord),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: AppColors.primaryColor.withOpacity(0.7)),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 14),
                children: [
                  TextSpan(
                    text: "$label: ",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}
