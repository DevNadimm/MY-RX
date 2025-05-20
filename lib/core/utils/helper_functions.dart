import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_app/features/medication/models/medication_model.dart';

class HelperFunctions {
  HelperFunctions._();

  /// Generate Notification Title
  static String getRandomNotificationTitle () {
    final titles = [
      '⏰ It’s med time! Let’s stay on track.',
      '💊 Your health matters – take your medicine.',
      '🔔 Friendly reminder to take your meds!',
      '🚨 Don’t skip today’s dose!',
      '🕒 Time to care for your health!',
      '🧠 A healthy routine starts with one dose!',
      '❤️ Take a moment for your health.',
      '🌟 You’re doing great – don’t forget your meds!',
      '✅ Let’s build a strong, healthy habit!',
    ];
    return titles[Random().nextInt(titles.length)];
  }

  /// Generate Notification Body
  static String getRandomNotificationBody (MedicationModel med) {
    final options = [
      'Time to take **${med.name}** (${med.type}) – ${med.whenToTake}. Stay strong!',
      'Take your ${med.type} **${med.name}** as planned – ${med.whenToTake}. You got this!',
      'Health first! It’s time for **${med.name}** – ${med.whenToTake}.',
      'Keep going! Don’t forget **${med.name}** (${med.type}) – ${med.whenToTake}.',
      'Here’s your reminder to take **${med.name}** – ${med.whenToTake}.',
      'Stay consistent with your meds – **${med.name}**, ${med.type}, now due.',
      'Taking **${med.name}** (${med.type}) now will help you feel better soon.',
      'You’re one step closer to wellness. Take **${med.name}** – ${med.whenToTake}.',
      '**${med.name}** time! Let’s keep you healthy – ${med.whenToTake}.',
    ];
    return options[Random().nextInt(options.length)];
  }

  static TimeOfDay convertTo24HourTime(String time12Hour) {
    final cleanedTime = time12Hour.replaceAll(RegExp(r'[\u00A0\u202F\u200B]+'), '').trim();

    // Regex to extract hours, minutes, AM/PM
    final regExp = RegExp(r'(\d{1,2}):(\d{2})\s*([AP]M)', caseSensitive: false);
    final match = regExp.firstMatch(cleanedTime);

    if (match == null) {
      throw FormatException('Invalid time format: $time12Hour');
    }

    int hour = int.parse(match.group(1)!);
    int minute = int.parse(match.group(2)!);
    final period = match.group(3)!.toUpperCase();

    if (period == 'PM' && hour != 12) {
      hour += 12;
    } else if (period == 'AM' && hour == 12) {
      hour = 0;
    }

    return TimeOfDay(hour: hour, minute: minute);
  }
}
