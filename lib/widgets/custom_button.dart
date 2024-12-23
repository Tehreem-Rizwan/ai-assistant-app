import 'package:ai_assistant/screens/helper/global.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            backgroundColor: Colors.blue,
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
