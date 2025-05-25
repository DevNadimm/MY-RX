import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastMessage {
  ToastMessage._();

  static success(String message) {
    toastification.show(
      title: Text(message),
      style: ToastificationStyle.flatColored,
      type: ToastificationType.success,
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.topCenter,
    );
  }

  static error(String message) {
    toastification.show(
      title: Text(message),
      style: ToastificationStyle.flatColored,
      type: ToastificationType.error,
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.topCenter,
    );
  }

  static void medAddSuccess() {
    success("Medication added successfully! 💊");
  }

  static void medAddFailed() {
    error("Failed to add medication. Please try again.");
  }

  static void medUpdateSuccess() {
    success("Medication updated successfully! 👍");
  }

  static void medUpdateFailed() {
    error("Failed to update medication. Please try again.");
  }

  static void medDeleteSuccess() {
    success("Medication deleted successfully. Take care!");
  }

  static void medDeleteFailed() {
    error("Failed to delete medication. Please try again.");
  }

  static void medDeleteAllSuccess() {
    success("All medications deleted successfully. You’re all clear now!");
  }

  static void medDeleteAllFailed() {
    error("Failed to delete all medications. Please try again.");
  }
}
