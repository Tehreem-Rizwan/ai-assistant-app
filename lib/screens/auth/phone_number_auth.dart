import 'package:ai_assistant/constants/app_colors.dart';
import 'package:ai_assistant/constants/app_fonts.dart';
import 'package:ai_assistant/widgets/Custom_Textfield_widget.dart';
import 'package:ai_assistant/widgets/Custom_text_widget.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import '../../constants/app_styling.dart';
import 'otp_verification_page.dart';

class SendCodePhoneno extends StatefulWidget {
  @override
  _SendCodePhonenoState createState() => _SendCodePhonenoState();
}

class _SendCodePhonenoState extends State<SendCodePhoneno> {
  final TextEditingController _phoneController = TextEditingController();
  String _verificationId = "";
  void _sendOtp() async {
    String phoneNumber = _phoneController.text.trim();

    // Check if the phone number starts with a '+' (E.164 format) or prepend the country code
    if (!phoneNumber.startsWith('+')) {
      phoneNumber = "+92$phoneNumber";
    }

    if (phoneNumber.length < 10 ||
        !RegExp(r'^\+\d{10,}$').hasMatch(phoneNumber)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Enter a valid phone number in E.164 format")),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) {
          // Handle auto-verification
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message ?? "Verification failed")),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationId = verificationId;
          });
          Get.to(() => OtpVerificationPage(
                verificationId: _verificationId,
                phoneNumber: phoneNumber,
              ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send OTP: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Padding(
        padding: symmetric(context, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h(context, 60)),
            CustomText(
              text: "Forgot Password",
              size: 32,
              weight: FontWeight.w700,
              color: kBlackyColor,
              fontFamily: AppFonts.Inter,
            ),
            SizedBox(height: h(context, 8)),
            CustomText(
              text: "Enter your phone number to receive an OTP",
              size: 14,
              weight: FontWeight.w600,
              fontFamily: AppFonts.Inter,
              color: kgreyblackColor,
            ),
            SizedBox(height: h(context, 40)),
            CustomTextField2(
              controller: _phoneController,
              hintText: "Enter phone number",
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: CustomButton(
          height: 52,
          text: "Send OTP",
          onTap: _sendOtp,
          width: 140,
          backgroundColor: Colors.blue,
          textSize: 14,
        ),
      ),
    );
  }
}
