import 'package:ai_assistant/main.dart';
import 'package:ai_assistant/screens/helper/global.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomButton(
      {super.key,
      required this.onTap,
      required this.text,
      required int height,
      required int textSize,
      required Color backgroundColor,
      required int width});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            backgroundColor: Theme.of(context).buttonColor,
            elevation: 0,
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            minimumSize: Size(mq.width * 0.4, 50)),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
