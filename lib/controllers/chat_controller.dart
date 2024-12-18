import 'package:ai_assistant/screens/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final TextEditingController textC = TextEditingController();
  final list = <Message>[].obs;
  void askQuestion() {
    if (textC.text.trim().isNotEmpty) {
      list.add(Message(msg: textC.text, msgType: MessageType.user));
      list.add(
          Message(msg: "I received your message", msgType: MessageType.bot));
      textC.text = "";
    }
  }
}
