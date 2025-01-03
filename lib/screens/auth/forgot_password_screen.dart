import 'dart:math';
import 'package:ai_assistant/constants/app_colors.dart';
import 'package:ai_assistant/constants/app_fonts.dart';
import 'package:ai_assistant/constants/app_styling.dart';
import 'package:ai_assistant/screens/auth/otp_verification_page.dart';
import 'package:ai_assistant/widgets/Custom_Textfield_widget.dart';
import 'package:ai_assistant/widgets/Custom_text_widget.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  static String _emailAddress = '';
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _emailController = TextEditingController(text: "");

  void _sendOtp() async {
    String email = _emailController.text;
    ForgotPasswordPage._emailAddress = email;
    String otp = (1000 + Random().nextInt(9000)).toString();

    await _sendOtpToEmail(email, otp);

    Get.to(() => OtpVerificationPage(
          verificationId: otp,
          phoneNumber: email,
        ));
  }

  Future<void> _sendOtpToEmail(String email, String otp) async {
    print("Sending OTP: $otp to email: $email");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: symmetric(
            context,
            horizontal: 24,
          ),
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
                text:
                    "Enter your email address, and we'll send you a confirmation code to reset your password",
                size: 14,
                weight: FontWeight.w600,
                fontFamily: AppFonts.Inter,
                color: kgreyblackColor,
              ),
              SizedBox(height: h(context, 40)),
              CustomText(
                text: "Email Address",
                fontFamily: AppFonts.Inter,
                size: 14,
                weight: FontWeight.w700,
                color: kBlackyColor,
              ),
              SizedBox(height: h(context, 8)),
              CustomTextField(
                controller: _emailController,
                hintText: "",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: only(
          context,
          bottom: MediaQuery.of(context).viewInsets.bottom + 30,
          left: 24,
          right: 24,
        ),
        child: CustomButton(
            height: 52,
            width: 140,
            text: "Email Address",
            textSize: 14,
            backgroundColor: kTertiaryColor,
            onTap: _sendOtp),
      ),
    );
  }
}
