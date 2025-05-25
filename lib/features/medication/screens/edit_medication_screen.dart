import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_app/core/themes/colors.dart';
import 'package:new_app/core/utils/constant_list.dart';
import 'package:new_app/core/utils/toast_message.dart';
import 'package:new_app/features/medication/controllers/notification_controller.dart';
import 'package:new_app/features/medication/database/db_helper.dart';
import 'package:new_app/features/medication/models/medication_model.dart';
import 'package:new_app/shared/widgets/app_bar_bottom_divider.dart';
import 'package:new_app/shared/widgets/app_bar_leading_arrow.dart';
import 'package:new_app/shared/widgets/custom_bottom_sheet.dart';
import 'package:new_app/shared/widgets/custom_text_field.dart';

class EditMedicationScreen extends StatefulWidget {
  const EditMedicationScreen({super.key, required this.medication, required this.onEditComplete});
  final MedicationModel medication;
  final VoidCallback onEditComplete;

  @override
  State<EditMedicationScreen> createState() => _EditMedicationScreenState();
}

class _EditMedicationScreenState extends State<EditMedicationScreen> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  final TextEditingController medicationName = TextEditingController();
  final TextEditingController medicationType = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  final TextEditingController pickTime = TextEditingController();

  String intakeTiming = 'Before Meals';

  @override
  void initState() {
    super.initState();
    storePreviousData();
  }

  void storePreviousData() {
    medicationName.text = widget.medication.name;
    medicationType.text = widget.medication.type;
    startDate.text = widget.medication.startDate;
    endDate.text = widget.medication.endDate;
    pickTime.text = widget.medication.time;
    intakeTiming = widget.medication.whenToTake;
  }

  Future<void> _selectOnlyDate(TextEditingController controller) async {
    final date = DateTime.tryParse(controller.text) ?? DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('edit_medication'.tr),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.5),
          child: AppBarBottomDivider(),
        ),
        leading: const AppBarLeadingArrow(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                label: 'medication_name_label'.tr,
                controller: medicationName,
                isRequired: true,
                hintText: 'type_here'.tr,
                validationLabel: 'Medication name',
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'medication_type'.tr,
                hintText: 'select'.tr,
                controller: medicationType,
                isRequired: true,
                readOnly: true,
                validationLabel: 'Medication type',
                onTap: () {
                  _showCustomBottomSheet(
                    items: ConstantList.drugList,
                    controller: medicationType,
                    title: 'select_medication'.tr,
                  );
                },
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: 'start_date'.tr,
                      hintText: 'select_date'.tr,
                      controller: startDate,
                      isRequired: true,
                      readOnly: true,
                      validationLabel: 'Start date',
                      onTap: () => _selectOnlyDate(startDate),
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      label: 'end_date'.tr,
                      hintText: 'select_date'.tr,
                      controller: endDate,
                      isRequired: true,
                      readOnly: true,
                      validationLabel: 'End date',
                      onTap: () => _selectOnlyDate(endDate),
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'pick_time'.tr,
                hintText: 'select_time'.tr,
                controller: pickTime,
                isRequired: true,
                readOnly: true,
                validationLabel: 'Time',
                onTap: () async {
                  final TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) {
                    pickTime.text = time.format(context);
                    setState(() {});
                  }
                },
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 16),
              Text('when_to_take'.tr, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildIntakeToggle('Before Meals'),
                  const SizedBox(width: 16),
                  _buildIntakeToggle('After Meals'),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: hasMedicationChanged() ? _editMedication : null,
                  child: Text('save_medication'.tr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntakeToggle(String label) {
    final bool isSelected = intakeTiming == label;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            intakeTiming = label;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _editMedication() async {
    if (globalKey.currentState?.validate() ?? false) {
      try {
        final oldMedication = widget.medication; // Store the original
        final oldId = oldMedication.id;

        final updatedMedication = MedicationModel(
          id: oldId,
          name: medicationName.text,
          type: medicationType.text,
          startDate: startDate.text,
          endDate: endDate.text,
          time: pickTime.text,
          whenToTake: intakeTiming,
        );

        // Cancel using the old medication info
        await NotificationController.cancelMedicationNotifications(oldMedication);
        await Future.delayed(const Duration(seconds: 1));

        // Update the medication in the database
        await DBHelper.updateMedication(updatedMedication);

        // Schedule new notifications using the updated data
        await NotificationController.scheduleMedicationNotifications(updatedMedication);

        _clearFields();
        ToastMessage.medUpdateSuccess();
        widget.onEditComplete();
      } catch (e) {
        ToastMessage.medUpdateFailed();
      }
    }
  }

  Future<void> _showCustomBottomSheet({
    required List<String> items,
    required TextEditingController controller,
    required String title,
  }) async {
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, bottomSheetSetState) {
            return CustomBottomSheetContent(
              items: items,
              controller: controller,
              title: title,
              onItemSelected: (item) {
                setState(() {
                  controller.text = item;
                });
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  bool hasMedicationChanged() {
    return widget.medication.name != medicationName.text ||
        widget.medication.type != medicationType.text ||
        widget.medication.startDate != startDate.text ||
        widget.medication.endDate != endDate.text ||
        widget.medication.time != pickTime.text ||
        widget.medication.whenToTake != intakeTiming;
  }

  void _clearFields() {
    medicationName.clear();
    medicationType.clear();
    startDate.clear();
    endDate.clear();
    pickTime.clear();
  }

  @override
  void dispose() {
    medicationName.dispose();
    medicationType.dispose();
    startDate.dispose();
    endDate.dispose();
    pickTime.dispose();
    super.dispose();
  }
}
