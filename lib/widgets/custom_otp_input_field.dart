import 'package:ai_assistant/constants/app_colors.dart';
import 'package:ai_assistant/constants/app_styling.dart';
import 'package:ai_assistant/widgets/Custom_Textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpInputField extends StatelessWidget {
  final TextEditingController controller;

  const OtpInputField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w(context, 75),
      height: h(context, 68),
      alignment: Alignment.center,
      child: CustomTextField2(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        controller: controller,
        hintText: '',
        style: TextStyle(
          fontSize: 32,
          color: kBlackyColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
