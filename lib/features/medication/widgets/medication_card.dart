import 'package:flutter/material.dart';
import 'package:new_app/core/themes/colors.dart';
import 'package:new_app/features/medication/models/medication_model.dart';

class MedicationCard extends StatelessWidget {
  final MedicationModel medication;

  const MedicationCard({super.key, required this.medication});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      color: AppColors.containerColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name and type row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  medication.name,
                  style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                ),
                Chip(
                  label: Text(medication.type),
                  backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                  labelStyle: const TextStyle(color: AppColors.primaryColor),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Dates row
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text('From: ${medication.startDate}'),
                const SizedBox(width: 12),
                Text('To: ${medication.endDate}'),
              ],
            ),
            const SizedBox(height: 8),
            // Time and timing row
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text('At: ${medication.time}'),
                const SizedBox(width: 12),
                Text('(${medication.timing})'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
