import 'package:flutter/material.dart';
import '../../../constants/app_styling.dart';
import '../../constants/app_colors.dart';
import 'Custom_text_widget.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final String fontFamily;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final FontWeight fontWeight;
  final double textSize;
  final double width;
  final double height;
  final VoidCallback onTap;

  const CustomButton({
    Key? key,
    required this.buttonText,
    this.fontFamily = "Inter",
    this.backgroundColor = kTertiaryColor,
    this.textColor = kSecondaryColor,
    this.borderRadius = 100.0,
    this.fontWeight = FontWeight.w700,
    required this.textSize,
    required this.width,
    required this.height,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: w(context, width),
        height: h(context, height),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(h(context, borderRadius)),
          color: backgroundColor,
        ),
        child: Center(
          child: CustomText(
            text: buttonText,
            size: textSize,
            weight: fontWeight,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  final double borderRadius;
  final FontWeight fontWeight;
  final double textSize;
  final double width;
  final double height;
  final VoidCallback onTap;

  const CustomButton2({
    Key? key,
    required this.text,
    this.backgroundColor = kSecondaryColor,
    this.textColor = kTertiaryColor,
    this.borderColor = kTertiaryColor,
    this.borderRadius = 100.0,
    this.fontWeight = FontWeight.w500,
    this.textSize = 16.0,
    this.width = 400.0,
    this.height = 50.0,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: w(context, width),
        height: h(context, height),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(h(context, borderRadius)),
            color: backgroundColor,
            border: Border.all(color: borderColor)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: text,
              size: textSize,
              weight: fontWeight,
              color: textColor,
              paddingLeft: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton3 extends StatelessWidget {
  final String buttonText;
  final String fontFamily;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final FontWeight fontWeight;
  final double textSize;
  final double width;
  final double height;
  final VoidCallback onTap;
  final Widget? child; // Add child parameter

  const CustomButton3({
    Key? key,
    required this.buttonText,
    this.fontFamily = "Inter",
    this.backgroundColor = kSecondaryColor,
    this.textColor = kSecondaryColor,
    this.borderRadius = 100.0,
    this.fontWeight = FontWeight.w700,
    required this.textSize,
    required this.width,
    required this.height,
    required this.onTap,
    this.child, // Initialize child parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: w(context, width),
        height: h(context, height),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(h(context, borderRadius)),
          color: backgroundColor,
          border: Border.all(
            color: kGreyColor,
            width: 1.0,
          ),
        ),
        child: Center(
          child: child ??
              CustomText(
                // Use the child if provided, otherwise use the default text
                text: buttonText,
                size: textSize,
                weight: fontWeight,
                color: textColor,
              ),
        ),
      ),
    );
  }
}

class CustomButton4 extends StatelessWidget {
  final String buttonText;
  final String fontFamily;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final FontWeight fontWeight;
  final double textSize;
  final double width;
  final double height;
  final VoidCallback onTap;
  final String? imagePath; // Optional image path
  final double imageSize; // Image size

  const CustomButton4({
    Key? key,
    required this.buttonText,
    this.fontFamily = "Inter",
    this.backgroundColor = kTertiaryColor,
    this.textColor = kSecondaryColor,
    this.borderRadius = 100.0,
    this.fontWeight = FontWeight.w700,
    required this.textSize,
    required this.width,
    required this.height,
    required this.onTap,
    this.imagePath, // Optional image path parameter
    this.imageSize = 24.0, // Default image size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: w(context, width),
        height: h(context, height),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(h(context, borderRadius)),
          color: backgroundColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imagePath !=
                  null) // Show the image only if imagePath is provided
                Padding(
                  padding: const EdgeInsets.only(
                      right: 8.0), // Space between image and text
                  child: Image.asset(
                    color: kSecondaryColor,
                    imagePath!,
                    width: imageSize,
                    height: imageSize,
                  ),
                ),
              CustomText(
                text: buttonText,
                size: textSize,
                weight: fontWeight,
                color: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton5 extends StatelessWidget {
  final String buttonText;
  final String fontFamily;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final FontWeight fontWeight;
  final double textSize;
  final double width;
  final double height;
  final VoidCallback onTap;
  final String? imagePath; // Optional image path
  final double imageSize; // Image size

  const CustomButton5({
    Key? key,
    required this.buttonText,
    this.fontFamily = "Inter",
    this.backgroundColor = kTransparentColor,
    this.textColor = kTertiaryColor,
    this.borderRadius = 100.0,
    this.fontWeight = FontWeight.w700,
    required this.textSize,
    required this.width,
    required this.height,
    required this.onTap,
    this.imagePath,
    this.imageSize = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: w(context, width),
        height: h(context, height),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(h(context, 16)),
          color: Colors.white,
          border: Border.all(
            color: kTertiaryColor,
            width: 1,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imagePath !=
                  null) // Show the image only if imagePath is provided
                Padding(
                  padding: const EdgeInsets.only(
                      right: 8.0), // Space between image and text
                  child: Image.asset(
                    color: kSecondaryColor,
                    imagePath!,
                    width: imageSize,
                    height: imageSize,
                  ),
                ),
              CustomText(
                text: buttonText,
                size: textSize,
                weight: fontWeight,
                color: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
