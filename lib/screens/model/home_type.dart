import 'package:ai_assistant/feature/chat_bot_feature.dart';
import 'package:ai_assistant/feature/image_feature.dart';
import 'package:ai_assistant/feature/translator_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum HomeType { aiChatBot, aiImage, aiTranslator }

extension MyHomeType on HomeType {
  String get title => switch (this) {
        HomeType.aiChatBot => 'AI ChatBot',
        HomeType.aiImage => 'AI Image',
        HomeType.aiTranslator => 'AI Translator',
      };
  String get lottie => switch (this) {
        HomeType.aiChatBot => 'ai_hand_waving.json',
        HomeType.aiImage => 'ai_play.json',
        HomeType.aiTranslator => 'ai_ask_me.json',
      };
  bool get leftAlign => switch (this) {
        HomeType.aiChatBot => true,
        HomeType.aiImage => true,
        HomeType.aiTranslator => true,
      };
  VoidCallback get OnTap => switch (this) {
        HomeType.aiChatBot => () => Get.to(() => ChatBotFeature()),
        HomeType.aiImage => () => Get.to(() => ImageFeature()),
        HomeType.aiTranslator => () => Get.to(() => TranslatorFeature()),
      };
}
