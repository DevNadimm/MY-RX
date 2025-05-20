import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastMessage {
  ToastMessage._();

  static success(String message) {
    toastification.show(
      title: Text(message),
      style: ToastificationStyle.flat,
      type: ToastificationType.success,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  static error(String message) {
    toastification.show(
      title: Text(message),
      style: ToastificationStyle.flat,
      type: ToastificationType.error,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }
}
