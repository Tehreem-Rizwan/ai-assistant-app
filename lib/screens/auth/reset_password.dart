import 'package:ai_assistant/constants/app_colors.dart';
import 'package:ai_assistant/constants/app_fonts.dart';
import 'package:ai_assistant/constants/app_styling.dart';
import 'package:ai_assistant/screens/auth/succcess_screen.dart';
import 'package:ai_assistant/widgets/Custom_Textfield_widget.dart';
import 'package:ai_assistant/widgets/Custom_text_widget.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class ResetPasswordPage extends StatelessWidget {
  final String email;
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ResetPasswordPage({required this.email});

  void _resetPassword(BuildContext context) async {
    if (newPasswordController.text == confirmPasswordController.text) {
      try {
        User? user = _auth.currentUser;

        if (user != null) {
          await user.updatePassword(newPasswordController.text);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password updated successfully!')),
          );

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: double.infinity,
                height: h(context, 492),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(h(context, 28)),
                    topRight: Radius.circular(h(context, 28)),
                  ),
                  color: kSecondaryColor,
                ),
                child: SuccessPage(),
              );
            },
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User not signed in')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating password: $e')),
        );
      }
    } else {
      // If passwords do not match, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kTransparentColor,
        elevation: 0,
        leading: Padding(
          padding: only(context, left: 20),
          child: Container(
            padding: symmetric(
              context,
              horizontal: 5,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: kWhite12Color,
              ),
            ),
            child: InkWell(
              child: Icon(
                Icons.arrow_back_ios,
                color: kPrimaryColor,
                size: 16,
              ),
              onTap: () {
                Get.back();
              },
            ),
          ),
        ),
        title: CustomText(
          text: "Reset Password",
          color: kBlackyColor,
          size: 16,
          fontFamily: AppFonts.Inter,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: only(context, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            CustomText(
              text: "Reset Password",
              size: 32,
              weight: FontWeight.w600,
              color: kBlackyColor,
              fontFamily: AppFonts.Inter,
            ),
            SizedBox(height: h(context, 8)),
            CustomText(
              text:
                  "Your new password must be different from the previously used password",
              size: 14,
              weight: FontWeight.w500,
              fontFamily: AppFonts.Inter,
              color: kgreyblackColor,
            ),
            SizedBox(height: h(context, 20)),
            CustomText(
              text: "New password",
              size: 14,
              weight: FontWeight.w700,
              color: kBlackyColor,
              fontFamily: AppFonts.Inter,
            ),
            SizedBox(height: 8),
            CustomTextField(
              controller: newPasswordController,
              hintText: "New password",
              obscureText: true,
              isIcon: true,
            ),
            SizedBox(height: h(context, 5)),
            CustomText(
              text: "Must be at least 8 characters",
              size: 14,
              color: kgreyblackColor,
              fontFamily: AppFonts.Inter,
            ),
            SizedBox(height: h(context, 20)),
            CustomText(
              text: "Confirm password",
              size: 14,
              weight: FontWeight.w700,
              color: kBlackyColor,
              fontFamily: AppFonts.Inter,
            ),
            SizedBox(height: h(context, 8)),
            CustomTextField(
              controller: confirmPasswordController,
              hintText: "Confirm password",
              obscureText: true,
              isIcon: true,
            ),
            SizedBox(height: h(context, 5)),
            CustomText(
              text: "Must be at least 8 characters",
              size: 14,
              color: kgreyblackColor,
              fontFamily: AppFonts.Inter,
            ),
            SizedBox(height: 32),
            CustomButton(
              height: 52,
              width: 140,
              textSize: 14,
              text: 'Verify account',
              backgroundColor: Colors.blue,
              onTap: () => _resetPassword(context),
            ),
          ],
        ),
      ),
    );
  }
}
