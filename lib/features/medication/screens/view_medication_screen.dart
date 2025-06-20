import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:new_app/core/utils/toast_message.dart';
import 'package:new_app/features/medication/controllers/notification_controller.dart';
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
    readMedications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('view_active_medications'.tr),
        leading: const AppBarLeadingArrow(),
        actions: [
          medicationList.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    deleteAllMedications();
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
                  return MedicationCard(
                    medication: medication,
                    onDelete: () {
                      deleteMedication(medication);
                    },
                    onEditComplete: () async {
                      await onEditComplete();
                    },
                  );
                },
              ),
      ),
    );
  }

  Future<void> readMedications() async {
    medicationList = await DBHelper.readMedication();;

    /// Delete inactive medications
    await deleteInActiveMedications();

    setState(() {
      isLoading = false;
    });
  }

  Future<void> deleteInActiveMedications() async {
    final currentDate = DateTime.now();
    final today = DateTime(currentDate.year, currentDate.month, currentDate.day);

    // Collect IDs to delete
    List<int> idsToDelete = [];

    for (var med in medicationList) {
      final end = DateTime.parse(med.endDate);
      final medEndDate = DateTime(end.year, end.month, end.day);

      if (today.isAfter(medEndDate)) {
        idsToDelete.add(med.id!);
      }

      // Remove from local list and database
      medicationList.removeWhere((e) => idsToDelete.contains(e.id));

      for (var id in idsToDelete) {
        await DBHelper.deleteMedication(id);
      }
    }
  }

  void deleteAllMedications() {
    showDialog(
      context: context,
      builder: (context) => DeleteDialog(
        title: 'Delete all medications?',
        subTitle: 'This action cannot be undone.\nAre you sure you want to permanently remove all medications from your list?',
        deleteBtnText: 'Delete All',
        onDelete: () async {
          try {
            Navigator.of(context).pop();

            /// Delete all medications from DB
            await Future.wait(medicationList.map((med) => DBHelper.deleteMedication(med.id!)));

            /// Cancel all notifications
            await NotificationService().cancelAllNotifications();

            medicationList.clear();
            setState(() {});
            ToastMessage.medDeleteAllSuccess();
          } catch (e) {
            debugPrint("Error Occurred when deleting all medications: $e");
            ToastMessage.medDeleteAllFailed();
          }
        },
      ),
    );
  }

  void deleteMedication(MedicationModel medication) {
    showDialog(
      context: context,
      builder: (_) => DeleteDialog(
        title: "Delete this medication?",
        subTitle: "This action cannot be undone.\nAre you sure you want to permanently remove this medication from your list?",
        onDelete: () async {
          try {
            Navigator.of(context).pop();

            /// Delete medication from DB
            await DBHelper.deleteMedication(medication.id!);

            /// Cancel notification
            NotificationController.cancelMedicationNotifications(medication);

            setState(() {
              medicationList.removeWhere((e) => e.id == medication.id);
            });
            ToastMessage.medDeleteSuccess();
          } catch (e) {
            debugPrint("Error Occurred when deleting medication: $e");
            ToastMessage.medDeleteFailed();
          }
        },
      ),
    );
  }

  Future<void> onEditComplete() async {
    medicationList = await DBHelper.readMedication();
    setState(() {});
    Get.back();
  }
}
