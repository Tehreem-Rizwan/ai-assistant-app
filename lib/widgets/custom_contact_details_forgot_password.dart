import 'package:ai_assistant/constants/app_colors.dart';
import 'package:ai_assistant/constants/app_fonts.dart';
import 'package:ai_assistant/constants/app_styling.dart';
import 'package:ai_assistant/widgets/Custom_text_widget.dart';
import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final bool selected;
  final Function() onTap;

  const OptionWidget({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: h(context, 8)),
        padding: all(context, 16),
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(h(context, 16)),
          border: Border.all(color: selected ? kTertiaryColor : kborder1Color),
        ),
        child: Row(
          children: [
            Container(
              padding: all(context, 10),
              decoration: BoxDecoration(
                color: kwhite34Color,
                borderRadius: BorderRadius.circular(h(context, 12)),
              ),
              child: Image.asset(iconPath, width: 24, height: 24),
            ),
            SizedBox(width: w(context, 16)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    fontFamily: AppFonts.Inter,
                    size: 12,
                    weight: FontWeight.w400,
                    color: kgreyblackColor,
                  ),
                  SizedBox(height: h(context, 4)),
                  CustomText(
                    text: subtitle,
                    fontFamily: AppFonts.Inter,
                    size: 14,
                    weight: FontWeight.w600,
                    color: kBlackyColor,
                  ),
                ],
              ),
            ),
            if (selected)
              Icon(Icons.check_circle, color: kTertiaryColor, size: 24)
          ],
        ),
      ),
    );
  }
}
