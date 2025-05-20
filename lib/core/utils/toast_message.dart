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
}
