import 'package:ai_assistant/constants/app_images.dart';
import 'package:ai_assistant/screens/helper/global.dart';
import 'package:ai_assistant/screens/model/message.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: Image.asset(
              Assets.imagesLogo,
              width: 24,
            )),
        Container(
          margin: EdgeInsets.only(bottom: mq.height * 0.02),
          padding: EdgeInsets.symmetric(
              vertical: mq.height * 0.01, horizontal: mq.width * 0.02),
          decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
          child: Text(message.msg),
        )
      ],
    );
  }
}
