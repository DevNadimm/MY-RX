import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastMessage {
  ToastMessage._();

  static success(String title, {String? description}) {
    toastification.show(
      title: Text(title),
      description: description != null ? Text(description) : null,
      style: ToastificationStyle.flatColored,
      type: ToastificationType.success,
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.topCenter,
    );
  }

  static error(String title, {String? description}) {
    toastification.show(
      title: Text(title),
      description: description != null ? Text(description) : null,
      style: ToastificationStyle.flatColored,
      type: ToastificationType.error,
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.topCenter,
    );
  }

  static void medAddSuccess() {
    success(
      "Medication Added!",
      description: "Your new medication has been saved successfully 💊",
    );
  }

  static void medAddFailed() {
    error(
      "Failed to Add Medication",
      description: "Something went wrong while saving your medication. Please try again.",
    );
  }

  static void medUpdateSuccess() {
    success(
      "Medication Updated!",
      description: "The medication details have been successfully updated 👍",
    );
  }

  static void medUpdateFailed() {
    error(
      "Update Failed",
      description: "Couldn't update the medication. Please try again later.",
    );
  }

  static void medDeleteSuccess() {
    success(
      "Medication Deleted!",
      description: "The medication has been removed from your list. Take care!",
    );
  }

  static void medDeleteFailed() {
    error(
      "Delete Failed",
      description: "We couldn’t delete the medication. Please try again.",
    );
  }

  static void medDeleteAllSuccess() {
    success(
      "All Medications Deleted!",
      description: "Your medication list is now clear. Stay healthy!",
    );
  }

  static void medDeleteAllFailed() {
    error(
      "Failed to Delete All",
      description: "We were unable to delete all medications. Please try again later.",
    );
  }
}
