import 'package:ai_assistant/screens/helper/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      color: Colors.blue.withOpacity(0.2),
      elevation: 0,
      child: Row(
        children: [
          Lottie.asset("assets/lottie/ai_hand_waving.json",
              width: mq.width * 35),
          Spacer(),
          Text(
            "AI ChatBot",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                letterSpacing: 1,
                fontWeight: FontWeight.w500),
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
