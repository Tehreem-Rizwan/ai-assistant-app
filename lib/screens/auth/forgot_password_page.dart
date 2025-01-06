import 'package:ai_assistant/constants/app_colors.dart';
import 'package:ai_assistant/constants/app_fonts.dart';
import 'package:ai_assistant/constants/app_styling.dart';
import 'package:ai_assistant/screens/auth/utils.dart';
import 'package:ai_assistant/widgets/Custom_text_widget.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emaillController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool emailError = false;
  String errorMessage = '';
  String emailErrorText = '';
  late final bool hasError;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: symmetric(
          context,
          horizontal: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h(context, 29)),
            CustomText(
              text: "Forgot Password",
              size: 28,
              weight: FontWeight.bold,
              color: kBlackyColor,
              fontFamily: AppFonts.Inter,
            ),
            SizedBox(height: h(context, 16)),
            CustomText(
              text:
                  "Your new password must be different from the previously used password",
              size: 16,
              color: kgreyblackColor,
              fontFamily: AppFonts.Inter,
            ),
            SizedBox(height: h(context, 28)),
            Container(
              width: w(context, 370),
              child: TextFormField(
                controller:
                    emaillController, // Corrected spelling for the controller
                decoration: InputDecoration(
                  hintText: "Email",
                  fillColor: kSecondaryColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: kWhite12Color,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: kSecondaryColor,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: h(context, 60)),
            CustomButton(
              height: 52,
              width: 140,
              text: "Forgot",
              textSize: 14,
              backgroundColor: kTertiaryColor,
              onTap: () {
                final email = emaillController.text.trim();
                if (email.isEmpty) {
                  Utils().showSnackbar(context, "Please enter your email.");
                  return;
                }
                auth.sendPasswordResetEmail(email: email).then((value) {
                  Utils().showSnackbar(context,
                      "We have sent you an email to recover your password, please check your email.");
                }).catchError((error) {
                  Utils().showSnackbar(context, error.toString());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
