import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'otp_verification_page.dart';
import 'package:ai_assistant/constants/app_colors.dart';
import 'package:ai_assistant/constants/app_fonts.dart';
import 'package:ai_assistant/widgets/custom_textfield_widget.dart';
import 'package:ai_assistant/widgets/custom_text_widget.dart';
import 'package:ai_assistant/widgets/custom_button.dart';

class SendCodePhoneno extends StatefulWidget {
  @override
  _SendCodePhonenoState createState() => _SendCodePhonenoState();
}

class _SendCodePhonenoState extends State<SendCodePhoneno> {
  final TextEditingController _phoneController = TextEditingController();
  String _verificationId = "";

  static const double paddingHorizontal = 24.0;
  static const double spacing = 16.0;

  void _sendOtp() async {
    String phoneNumber = _formatPhoneNumber(_phoneController.text);

    if (!_validatePhoneNumber(phoneNumber)) {
      _showSnackbar("Enter a valid phone number in E.164 format");
      return;
    }

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          _showSnackbar(e.message ?? "Verification failed");
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
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
      _showSnackbar("Failed to send OTP: $e");
    }
  }

  String _formatPhoneNumber(String phoneNumber) {
    phoneNumber = phoneNumber.trim();
    return phoneNumber.startsWith('+') ? phoneNumber : "+92$phoneNumber";
  }

  bool _validatePhoneNumber(String phoneNumber) {
    return phoneNumber.length >= 10 &&
        RegExp(r'^\+\d{10,}$').hasMatch(phoneNumber);
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: spacing * 4),
              _buildHeader(),
              SizedBox(height: spacing),
              _buildSubHeader(),
              SizedBox(height: spacing * 2.5),
              _buildPhoneNumberField(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildSendOtpButton(),
    );
  }

  Widget _buildHeader() {
    return CustomText(
      text: "Forgot Password",
      size: 32,
      weight: FontWeight.w700,
      color: kPrimaryColor,
      fontFamily: AppFonts.Inter,
    );
  }

  Widget _buildSubHeader() {
    return CustomText(
      text: "Enter your phone number to receive an OTP",
      size: 14,
      weight: FontWeight.w600,
      fontFamily: AppFonts.Inter,
      color: kgreyblackColor,
    );
  }

  Widget _buildPhoneNumberField() {
    return CustomTextField2(
      controller: _phoneController,
      hintText: "Enter phone number",
      keyboardType: TextInputType.phone,
    );
  }

  Widget _buildSendOtpButton() {
    return Padding(
      padding: const EdgeInsets.all(paddingHorizontal),
      child: CustomButton(
        height: 52,
        text: "Send OTP",
        onTap: _sendOtp,
        width: 140,
        backgroundColor: Colors.blue,
        textSize: 14,
      ),
    );
  }
}
