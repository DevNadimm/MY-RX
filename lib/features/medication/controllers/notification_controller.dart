import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_app/core/utils/helper_functions.dart';
import 'package:new_app/features/medication/models/medication_model.dart';
import '../services/notification_service.dart';

class NotificationController {
  static void scheduleMedicationNotifications(MedicationModel medication) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    final DateTime startDate = dateFormat.parse(medication.startDate);
    final DateTime endDate = dateFormat.parse(medication.endDate);
    final TimeOfDay timeOfDay = HelperFunctions.convertTo24HourTime(medication.time);

    DateTime currentDate = startDate;
    int notificationId = (medication.id ?? DateTime.now().millisecondsSinceEpoch) % 2147483647;
    int baseId = (medication.id ?? DateTime.now().millisecondsSinceEpoch) % 2147483647;
    int dayIndex = 0;

    while (!currentDate.isAfter(endDate)) {
      final DateTime scheduledDateTime = DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day,
        timeOfDay.hour,
        timeOfDay.minute,
      );

      if (scheduledDateTime.isAfter(DateTime.now())) {
        NotificationService().scheduleNotification(
          id: notificationId++,
          title: 'Time to take your medication',
          body: '${medication.name} - ${medication.type}',
          scheduledDateTime: scheduledDateTime,
        );
        debugPrint('Scheduled notification for $scheduledDateTime');
      }

      currentDate = currentDate.add(const Duration(days: 1));
    }
  }

  static void cancelMedicationNotifications(MedicationModel medication) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final DateTime startDate = dateFormat.parse(medication.startDate);
    final DateTime endDate = dateFormat.parse(medication.endDate);

    final int baseId = (medication.id ?? 0) % 2147483647;
    int dayIndex = 0;
    DateTime currentDate = startDate;

    while (!currentDate.isAfter(endDate)) {
      final int notificationId = baseId * 1000 + dayIndex;
      NotificationService().cancelNotification(notificationId);
      debugPrint('Cancelled notification ID: $notificationId');
      currentDate = currentDate.add(const Duration(days: 1));
      dayIndex++;
    }
  }
}
