import 'package:new_app/features/medication/models/medication_model.dart';

final List<MedicationModel> medications = [
  MedicationModel(
    name: 'Paracetamol',
    type: 'Tablet',
    startDate: '2025-05-01',
    endDate: '2025-05-07',
    time: '08:00 AM',
    whenToTake: 'Before Eat',
  ),
  MedicationModel(
    name: 'Ibuprofen',
    type: 'Capsule',
    startDate: '2025-05-02',
    endDate: '2025-05-10',
    time: '06:00 PM',
    whenToTake: 'After Eat',
  ),
];
