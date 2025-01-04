import 'package:ai_assistant/constants/app_colors.dart';
import 'package:ai_assistant/constants/app_fonts.dart';
import 'package:ai_assistant/constants/app_styling.dart';
import 'package:ai_assistant/controllers/registration_controller.dart';
import 'package:ai_assistant/screens/auth/signin_screen.dart';
import 'package:ai_assistant/widgets/Custom_Textfield_widget.dart';
import 'package:ai_assistant/widgets/Custom_text_widget.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegistrationScreen extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h(context, 62)),
              CustomText(
                text: "Create new account",
                size: 32,
                weight: FontWeight.w800,
                color: kBlackyColor,
                fontFamily: AppFonts.Inter,
              ),
              SizedBox(height: h(context, 8)),
              CustomText(
                text:
                    'Create an account to start looking for the AI\nAssistant',
                size: 14,
                weight: FontWeight.w500,
                color: kgreyblackColor,
                fontFamily: AppFonts.Inter,
              ),
              SizedBox(height: h(context, 18)),
              CustomText(
                text: "Email Address",
                size: 14,
                weight: FontWeight.w700,
                color: kBlackyColor,
              ),
              SizedBox(height: h(context, 8)),
              CustomTextField(
                controller: controller.emailController,
                hintText: "Enter Email",
              ),
              SizedBox(height: h(context, 12)),
              CustomText(
                text: "Username",
                size: 14,
                weight: FontWeight.w700,
                color: kBlackyColor,
              ),
              SizedBox(height: h(context, 8)),
              CustomTextField(
                controller: controller.userNameController,
                hintText: "Enter username",
              ),
              SizedBox(height: h(context, 12)),
              CustomText(
                text: "Password",
                size: 14,
                weight: FontWeight.w700,
                color: kBlackyColor,
              ),
              SizedBox(height: h(context, 8)),
              CustomTextField(
                controller: controller.passwordController,
                hintText: "Password",
                obscureText: true,
                isIcon: true,
              ),
              SizedBox(height: h(context, 28)),
              Row(
                children: [
                  Obx(() => Checkbox(
                        value: controller.isChecked.value,
                        onChanged: (value) {
                          controller.isChecked.value = value ?? true;
                        },
                        activeColor: kTertiaryColor,
                      )),
                  Expanded(
                    child: Wrap(
                      children: [
                        CustomText(
                          text: "I Agree with",
                          size: 14,
                          weight: FontWeight.w500,
                          color: kBlackyColor,
                          fontFamily: AppFonts.Inter,
                        ),
                        CustomText(
                          text: "terms of service",
                          size: 14,
                          fontFamily: AppFonts.Inter,
                          weight: FontWeight.bold,
                          color: kTertiaryColor,
                        ),
                        CustomText(
                          text: "and",
                          size: 14,
                          color: kBlackyColor,
                          fontFamily: AppFonts.Inter,
                        ),
                        CustomText(
                          text: "privacy",
                          size: 14,
                          weight: FontWeight.bold,
                          color: kTertiaryColor,
                          fontFamily: AppFonts.Inter,
                        ),
                        CustomText(
                          text: "policy",
                          size: 14,
                          weight: FontWeight.bold,
                          color: kTertiaryColor,
                          fontFamily: AppFonts.Inter,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: h(context, 30)),
              Center(
                child: CustomButton(
                  height: 52,
                  width: 327,
                  text: "Register",
                  textSize: 14,
                  backgroundColor: kTertiaryColor,
                  onTap: controller.register,
                ),
              ),
              SizedBox(height: h(context, 32)),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Do not have an account",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: kBlackyColor,
                      fontFamily: AppFonts.Inter,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kTertiaryColor,
                          fontFamily: AppFonts.Inter,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(() => SigninScreen(
                                  userEmail: 'tehreemrizwan30@gmail.com',
                                ));
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
