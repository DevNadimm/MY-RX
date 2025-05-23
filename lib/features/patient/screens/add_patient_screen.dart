import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/features/patient/widgets/upload_image_section.dart';
import 'package:new_app/shared/widgets/app_bar_bottom_divider.dart';
import 'package:new_app/shared/widgets/app_bar_leading_arrow.dart';
import 'package:new_app/shared/widgets/custom_text_field.dart';

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen({super.key});

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _patientNameController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _whatsappNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _chiefComplainController = TextEditingController();
  final _familyDiseaseController = TextEditingController();
  final _otHistoryController = TextEditingController();
  final _presentMedicationController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  List<File> prescriptionImages = [];
  List<File> reportImages = [];

  @override
  void dispose() {
    _patientNameController.dispose();
    _contactNumberController.dispose();
    _whatsappNumberController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _chiefComplainController.dispose();
    _familyDiseaseController.dispose();
    _otHistoryController.dispose();
    _presentMedicationController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add_patient'.tr),
        leading: const AppBarLeadingArrow(),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.5),
          child: AppBarBottomDivider(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomTextField(
                label: 'patient_name'.tr,
                isRequired: true,
                controller: _patientNameController,
                validationLabel: 'Patient name',
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: 'contact_number'.tr,
                      isRequired: true,
                      keyboardType: TextInputType.phone,
                      controller: _contactNumberController,
                      validationLabel: 'Contact number',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      label: 'whatsapp_number'.tr,
                      keyboardType: TextInputType.phone,
                      controller: _whatsappNumberController,
                      validationLabel: 'WhatsApp number',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'patient_email'.tr,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validationLabel: 'Email',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'patient_address'.tr,
                controller: _addressController,
                validationLabel: 'Address',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'chief_complain'.tr,
                hintText: 'chief_complain'.tr,
                controller: _chiefComplainController,
                validationLabel: 'Chief complain',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'family_disease'.tr,
                hintText: 'family_disease'.tr,
                controller: _familyDiseaseController,
                validationLabel: 'Family disease',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'ot_history'.tr,
                hintText: 'ot_history'.tr,
                controller: _otHistoryController,
                validationLabel: 'OT history',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'present_medication'.tr,
                hintText: 'present_medication'.tr,
                controller: _presentMedicationController,
                validationLabel: 'Present medication',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: 'height'.tr,
                      hintText: 'height_hint'.tr, // e.g., Height like 5'11"
                      controller: _heightController,
                      validationLabel: 'Height',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      label: 'weight'.tr,
                      hintText: 'weight_hint'.tr, // e.g., Weight like 55
                      suffixText: 'kg',
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      controller: _weightController,
                      validationLabel: 'Weight',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              UploadImageSection(
                title: "upload_prescription".tr,
                onImagesChanged: (images) {
                  setState(() {
                    prescriptionImages = images;
                  });
                },
              ),
              const SizedBox(height: 16),
              UploadImageSection(
                title: "upload_reports".tr,
                onImagesChanged: (images) {
                  setState(() {
                    reportImages = images;
                  });
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submit,
                  child: Text("save_patient".tr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
