import 'package:ai_assistant/constants/app_colors.dart';
import 'package:ai_assistant/constants/app_fonts.dart';
import 'package:ai_assistant/constants/app_images.dart';
import 'package:ai_assistant/screens/auth/forgot_password_screen.dart';
import 'package:ai_assistant/screens/auth/phone_number_auth.dart';
import 'package:ai_assistant/widgets/Custom_text_widget.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:ai_assistant/widgets/custom_contact_details_forgot_password.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../constants/app_styling.dart';

class ForgotPasswordSelection extends StatefulWidget {
  final String userEmail;

  const ForgotPasswordSelection({Key? key, required this.userEmail})
      : super(key: key);

  @override
  _ForgotPasswordSelectionState createState() =>
      _ForgotPasswordSelectionState();
}

class _ForgotPasswordSelectionState extends State<ForgotPasswordSelection> {
  String? selectedOption = 'Send via SMS';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h(context, 16)),
            CustomText(
              text: "Forgot Password",
              size: 24,
              weight: FontWeight.w800,
              color: kBlackyColor,
              fontFamily: AppFonts.Inter,
            ),
            SizedBox(height: h(context, 12)),
            CustomText(
              text:
                  "Select which contact details we should use to reset your password",
              size: 14,
              weight: FontWeight.w500,
              color: kgreyblackColor,
              fontFamily: AppFonts.Inter,
            ),
            SizedBox(height: h(context, 24)),
            // OptionWidget(
            //   iconPath: Assets.imagesWhatsapp,
            //   title: AppLocalizations.of(context)!.sendviaWhatsApp,
            //   subtitle: '',
            //   selected:
            //       selectedOption == AppLocalizations.of(context)!.whatsApp,
            //   onTap: () {
            //     setState(() {
            //       selectedOption = AppLocalizations.of(context)!.whatsApp;
            //     });
            //   },
            // ),
            OptionWidget(
              iconPath: Assets.imagesEmail,
              title: "Send via Email",
              subtitle: widget.userEmail,
              selected: selectedOption == "email",
              onTap: () {
                setState(() {
                  selectedOption = "email";
                });
              },
            ),
            OptionWidget(
              iconPath: Assets.imagesWhatsapp,
              title: "Send Via SMS",
              subtitle: 'Your phone number',
              selected: selectedOption == 'Send via SMS',
              onTap: () {
                setState(() {
                  selectedOption = 'Send via SMS';
                });
              },
            ),
            SizedBox(height: h(context, 40)),
            Center(
              child: CustomButton(
                height: 52,
                width: 140,
                text: "Continue",
                textSize: 14,
                backgroundColor: Colors.blue,
                onTap: () {
                  if (selectedOption == 'Send via SMS') {
                    Get.to(() => SendCodePhoneno());
                    //  Navigator.push(
                    // context,
                    // MaterialPageRoute(
                    //   builder: (context) => PhoneNumberScreen(), // Navigate to PhoneNumberScreen
                    // ),
                    //  );
                  } else if (selectedOption == "email") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage(),
                      ),
                    );
                  } else {
                    print('Selected option: $selectedOption');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
