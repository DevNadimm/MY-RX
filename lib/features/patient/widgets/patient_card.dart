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
            // Name and Email
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  patient.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.person, color: AppColors.primaryColor),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              patient.email,
              style: TextStyle(color: Colors.grey[700]),
            ),
            const Divider(height: 20, thickness: 1),

            // Contact Info
            _buildInfoRow(Icons.phone, "Contact", patient.contactNo),
            _buildInfoRow(Icons.whatshot, "WhatsApp", patient.whatsappNo),
            _buildInfoRow(Icons.home, "Address", patient.address),

            const Divider(height: 20, thickness: 1),

            // Medical Info
            _buildInfoRow(Icons.medical_services, "Chief Complain",
                patient.chiefComplain),
            _buildInfoRow(
                Icons.family_restroom, "Family Disease", patient.familyDisease),
            _buildInfoRow(
                Icons.local_hospital, "OT History", patient.otHistory),
            _buildInfoRow(
                Icons.medication, "Medication", patient.presentMedication),

            const Divider(height: 20, thickness: 1),

            // Physical Info
            _buildInfoRow(Icons.height, "Height", patient.height),
            _buildInfoRow(Icons.monitor_weight, "Weight", patient.weight),
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
                style: const TextStyle(color: Colors.black),
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
}
