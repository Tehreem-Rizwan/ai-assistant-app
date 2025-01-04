import 'package:ai_assistant/constants/app_colors.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:ai_assistant/widgets/custom_otp_input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtpVerificationPage extends StatelessWidget {
  final String verificationId;
  final String phoneNumber;

  OtpVerificationPage(
      {required this.verificationId, required this.phoneNumber});

  final TextEditingController otpController = TextEditingController();

  void _verifyOtp(BuildContext context) async {
    String otp = otpController.text.trim();

    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Enter a valid 6-digit OTP")),
      );
      return;
    }

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Phone number verified successfully!")),
      );

      // Navigate to the next page
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid OTP")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text(
              "Verify OTP",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                OtpInputField(controller: otpController),
                OtpInputField(controller: otpController),
              ],
            ),
            SizedBox(height: 16),
            CustomButton(
              height: 52,
              text: "Verify",
              onTap: () => _verifyOtp(context),
              textSize: 14,
              width: 140,
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
