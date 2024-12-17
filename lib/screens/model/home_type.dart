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
}
