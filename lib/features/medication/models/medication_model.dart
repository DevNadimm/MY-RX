class MedicationModel {
  final String name;
  final String type;
  final String startDate;
  final String endDate;
  final String time;
  final String whenToTake;

  MedicationModel({
    required this.name,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.time,
    required this.whenToTake,
  });

  // Convert a MedicationModel into a Map (for SQLite or storage)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'startDate': startDate,
      'endDate': endDate,
      'time': time,
      'whenToTake': whenToTake,
    };
  }

  // Create a MedicationModel from a Map
  factory MedicationModel.fromMap(Map<String, dynamic> map) {
    return MedicationModel(
      name: map['name'],
      type: map['type'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      time: map['time'],
      whenToTake: map['whenToTake'],
    );
  }
}
