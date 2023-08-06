import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarUtil {
  static void showSuccess({required String message}) {
    Get.snackbar(
      "Sukses!",
      message,
      titleText: const Text(
        "SUKSES..",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      icon: const Icon(Icons.thumb_up, color: Colors.white),
      backgroundColor: Colors.green,
      shouldIconPulse: true,
      barBlur: 10,
      isDismissible: true,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    );
  }

  static void showWarning({required String message}) {
    Get.snackbar(
      "Perhatian!",
      message,
      titleText: const Text(
        "PERHATIAN..",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      icon: const Icon(Icons.warning, color: Colors.white),
      backgroundColor: Colors.orange,
      shouldIconPulse: true,
      barBlur: 10,
      isDismissible: true,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    );
  }

  static void showError({required String message}) {
    Get.snackbar(
      "Error!",
      message,
      titleText: const Text(
        "ERROR..",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      icon: const Icon(Icons.warning, color: Colors.white),
      backgroundColor: Colors.red,
      shouldIconPulse: true,
      barBlur: 10,
      isDismissible: true,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    );
  }

  static void showInfo({required String message}) {
    Get.snackbar(
      "Info!",
      message,
      titleText: const Text(
        "INFO..",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      icon: const Icon(Icons.warning, color: Colors.white),
      backgroundColor: Colors.blue,
      shouldIconPulse: true,
      barBlur: 10,
      isDismissible: true,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    );
  }
}