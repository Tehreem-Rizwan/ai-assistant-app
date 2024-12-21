import 'package:ai_assistant/screens/helper/global.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  final textC = TextEditingController();
  Future<void> createAIImage() async {
    OpenAI.apiKey = apiKey;
    if (textC.text.trim().isNotEmpty) {
      textC.text;
    }
  }
}
