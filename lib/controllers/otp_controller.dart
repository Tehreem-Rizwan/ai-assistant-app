import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final String otp;
  var start = 30.obs;
  Timer? _timer;
  final String email;
  final TextEditingController otpController = TextEditingController();

  OtpController({required this.otp, required this.email});

  @override
  void onInit() {
    sendOtp();
    startTimer();
    super.onInit();
  }

  void sendOtp() {
    print("Sending OTP to $email");
  }

  // Timer logic
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (start.value > 0) {
        start.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  void verifyOtp() {
    if (otpController.text == otp) {
      Get.snackbar("Success", "OTP Verified!");
    } else {
      Get.snackbar("Error", "Invalid OTP");
    }
  }

  void resendOtp() {
    start.value = 30;
    sendOtp();
    startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    otpController.dispose();
    super.onClose();
  }
}
