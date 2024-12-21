import 'package:ai_assistant/constants/app_images.dart';
import 'package:ai_assistant/screens/helper/global.dart';
import 'package:ai_assistant/screens/model/message.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const r = Radius.circular(15);
    return message.msgType == MessageType.bot
        ? Row(
            children: [
              SizedBox(
                width: 6,
              ),
              CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    Assets.imagesLogo,
                    width: 24,
                  )),
              Container(
                constraints: BoxConstraints(maxWidth: mq.width * 0.6),
                margin: EdgeInsets.only(
                    bottom: mq.height * 0.02, left: mq.width * 0.02),
                padding: EdgeInsets.symmetric(
                    vertical: mq.height * 0.01, horizontal: mq.width * 0.02),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.only(
                        topLeft: r, topRight: r, bottomRight: r)),
                child: message.msg.isEmpty
                    ? AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            ' Please wait... ',
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        repeatForever: true,
                      )
                    : Text(
                        message.msg,
                        textAlign: TextAlign.center,
                      ),
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: mq.width * 0.6),
                margin: EdgeInsets.only(
                    bottom: mq.height * 0.02, right: mq.width * 0.02),
                padding: EdgeInsets.symmetric(
                    vertical: mq.height * 0.01, horizontal: mq.width * 0.02),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.only(
                        topLeft: r, topRight: r, bottomLeft: r)),
                child: Text(
                  message.msg,
                  textAlign: TextAlign.center,
                ),
              ),
              CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                  )),
              SizedBox(
                width: 6,
              ),
            ],
          );
  }
}
