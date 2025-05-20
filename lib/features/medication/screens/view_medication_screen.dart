import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:new_app/core/utils/toast_message.dart';
import 'package:new_app/features/medication/database/db_helper.dart';
import 'package:new_app/features/medication/models/medication_model.dart';
import 'package:new_app/features/medication/services/notification_service.dart';
import 'package:new_app/features/medication/widgets/medication_card.dart';
import 'package:new_app/shared/widgets/app_bar_bottom_divider.dart';
import 'package:new_app/shared/widgets/app_bar_leading_arrow.dart';
import 'package:new_app/shared/widgets/delete_dialog.dart';
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
        actions: [
          medicationList.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    deleteAllMeds();
                  },
                  icon: const Icon(
                    HugeIcons.strokeRoundedDelete02,
                    color: Colors.red,
                  ),
                )
              : const SizedBox.shrink()
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.5),
          child: AppBarBottomDivider(),
        ),
      ),
      body: Visibility(
        visible: !isLoading,
        replacement: const Center(child: CircularProgressIndicator()),
        child: medicationList.isEmpty
            ? const EmptyList(
                title: 'No Medications Listed Yet',
              )
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

  void deleteAllMeds() {
    showDialog(
      context: context,
      builder: (context) => DeleteDialog(
        title: 'Delete All Medications',
        subTitle: 'Are you sure you want to delete all medications? This action cannot be undone.',
        deleteBtnText: 'Delete All',
        onDelete: () async {
          try {
            Navigator.of(context).pop();

            /// Delete all medications
            await Future.wait(medicationList.map((med) => DBHelper.deleteMedication(med.id!)));

            /// Cancel all notifications
            await NotificationService().cancelAllNotifications();

            medicationList.clear();
            setState(() {});
            ToastMessage.success("All medications deleted successfully");
          } catch (e) {
            debugPrint("Error Occurred when deleting all medications: $e");
            ToastMessage.error("Failed to delete medications. Please try again.");
          }
        },
      ),
    );
  }
}
