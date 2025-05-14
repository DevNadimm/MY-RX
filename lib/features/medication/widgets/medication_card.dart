import 'package:flutter/material.dart';
import 'package:new_app/core/themes/colors.dart';
import 'package:new_app/features/medication/models/medication_model.dart';

class MedicationCard extends StatelessWidget {
  final MedicationModel medication;

  const MedicationCard({super.key, required this.medication});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.containerColor,
        border: const Border(left: BorderSide(width: 4, color: AppColors.primaryColor)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      medication.name,
                      style: theme.textTheme.headlineSmall,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        medication.type,
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 18, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(child: Text('From: ${medication.startDate}')),
                    const SizedBox(width: 8),
                    Expanded(child: Text('To: ${medication.endDate}')),
                  ],
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    const Icon(Icons.access_time, size: 18, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(child: Text('At: ${medication.time}')),
                    const SizedBox(width: 8),
                    Expanded(child: Text('(${medication.whenToTake})')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
