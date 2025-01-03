import 'package:ai_assistant/constants/app_colors.dart';
import 'package:ai_assistant/constants/app_fonts.dart';
import 'package:ai_assistant/constants/app_images.dart';
import 'package:ai_assistant/constants/app_styling.dart';
import 'package:ai_assistant/screens/auth/signin_screen.dart';
import 'package:ai_assistant/widgets/Custom_text_widget.dart';
import 'package:ai_assistant/widgets/common_image_view_widget.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Adjust size according to content
      children: [
        SizedBox(height: h(context, 32)),
        CommonImageView(
          imagePath: Assets.imagesIllustrationSuccess,
          fit: BoxFit.contain,
          height: 168,
          width: 202.62,
        ),
        SizedBox(height: h(context, 32)),
        CustomText(
          text: "Password Changed",
          size: 24,
          weight: FontWeight.bold,
          fontFamily: AppFonts.Inter,
          color: kBlackyColor,
        ),
        SizedBox(height: h(context, 14)),
        CustomText(
          text:
              "Password changed successfully. You can log in again with your new password",
          size: 14,
          weight: FontWeight.w500,
          color: kgreyblackColor,
          fontFamily: AppFonts.Inter,
        ),
        SizedBox(height: h(context, 36)),
        CustomButton(
          height: 52,
          width: 140,
          text: "Verify Account",
          textSize: 14,
          backgroundColor: Colors.blue,
          onTap: () {
            Get.to(() => SigninScreen(
                  userEmail: 'tehreemrizwan30@gmail.com',
                ));
          },
        ),
      ],
    );
  }
}
