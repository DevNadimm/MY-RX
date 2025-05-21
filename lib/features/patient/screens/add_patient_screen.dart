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
                label: 'Patient Name',
                isRequired: true,
                controller: _patientNameController,
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: 'Contact Number',
                      isRequired: true,
                      keyboardType: TextInputType.phone,
                      controller: _contactNumberController,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      label: 'WhatsApp Number',
                      keyboardType: TextInputType.phone,
                      controller: _whatsappNumberController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Patient Address',
                controller: _addressController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Patient Email',
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Chief Complain (if any)',
                hintText: 'Chief Complain',
                controller: _chiefComplainController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Family Disease (if any)',
                hintText: 'Family Disease',
                controller: _familyDiseaseController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'OT History (if any)',
                hintText: 'OT History',
                controller: _otHistoryController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Present Medication (if any)',
                hintText: 'Present Medication',
                controller: _presentMedicationController,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: 'Height',
                      hintText: "Height like 5'11\"",
                      controller: _heightController,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      label: 'Weight',
                      hintText: 'Weight like 55',
                      suffixText: 'kg',
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      controller: _weightController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              UploadImageSection(
                title: "Upload Prescription",
                onImagesChanged: (images) {
                  setState(() {
                    prescriptionImages = images;
                  });
                },
              ),
              const SizedBox(height: 16),
              UploadImageSection(
                title: "Upload Reports",
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
                  child: const Text("Save Patient"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
