import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final int height;
  final int textSize;
  final Color backgroundColor;
  final int width;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.height,
    required this.textSize,
    required this.backgroundColor,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Align(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          backgroundColor: backgroundColor, // Use the provided background color
          elevation: 0,
          textStyle: TextStyle(
              fontSize: textSize.toDouble(), fontWeight: FontWeight.w500),
          minimumSize: Size(screenWidth * (width / 100),
              height.toDouble()), // Use percentage for width and height
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
