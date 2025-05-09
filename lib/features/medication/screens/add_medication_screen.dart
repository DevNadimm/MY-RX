import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:intl/intl.dart';
import 'package:new_app/core/themes/colors.dart';
import 'package:new_app/core/utils/constant_list.dart';
import 'package:new_app/shared/widgets/app_bar_bottom_divider.dart';
import 'package:new_app/shared/widgets/app_bar_leading_arrow.dart';
import 'package:new_app/shared/widgets/custom_bottom_sheet.dart';
import 'package:new_app/shared/widgets/custom_text_field.dart';

class AddMedicationScreen extends StatefulWidget {
  const AddMedicationScreen({super.key});

  @override
  State<AddMedicationScreen> createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  final TextEditingController medicationName = TextEditingController();
  final TextEditingController drugType = TextEditingController();
  final TextEditingController startDateTime = TextEditingController();
  final TextEditingController endDateTime = TextEditingController();
  final TextEditingController pickTimeController = TextEditingController();

  String intakeTiming = 'Before Eat';

  Future<void> _selectOnlyDate(TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add_medication'.tr),
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
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'medication_type'.tr,
                hintText: 'select'.tr,
                controller: drugType,
                isRequired: true,
                readOnly: true,
                onTap: () {
                  showCustomBottomSheet(
                    items: ConstantList.drugList,
                    controller: drugType,
                    title: 'select_medication'.tr,
                  );
                },
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: 'start_date'.tr,
                      hintText: 'select_date'.tr,
                      controller: startDateTime,
                      isRequired: true,
                      readOnly: true,
                      onTap: () => _selectOnlyDate(startDateTime),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      label: 'end_date'.tr,
                      hintText: 'select_date'.tr,
                      controller: endDateTime,
                      isRequired: true,
                      readOnly: true,
                      onTap: () => _selectOnlyDate(endDateTime),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'pick_time'.tr,
                hintText: 'select_time'.tr,
                controller: pickTimeController,
                isRequired: true,
                readOnly: true,
                onTap: () async {
                  final TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) {
                    pickTimeController.text = time.format(context);
                  }
                },
              ),
              const SizedBox(height: 16),
              Text('when_to_take'.tr, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildIntakeToggle('Before Eat'),
                  const SizedBox(width: 16),
                  _buildIntakeToggle('After Eat'),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _saveMedication,
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
            color:
                isSelected ? AppColors.primaryColor : AppColors.primaryColor.withOpacity(0.1),
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

  void _saveMedication() {
    if (globalKey.currentState?.validate() ?? false) {}
  }

  Future<void> showCustomBottomSheet({
    required List<String> items,
    required TextEditingController controller,
    required String title,
  }) async {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
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

  @override
  void dispose() {
    medicationName.dispose();
    drugType.dispose();
    startDateTime.dispose();
    endDateTime.dispose();
    pickTimeController.dispose();
    super.dispose();
  }
}
