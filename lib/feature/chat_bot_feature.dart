import 'package:ai_assistant/controllers/chat_controller.dart';
import 'package:ai_assistant/main.dart';
import 'package:ai_assistant/screens/helper/global.dart';
import 'package:ai_assistant/widgets/message_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ChatBotFeature extends StatefulWidget {
  const ChatBotFeature({super.key});

  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}

class _ChatBotFeatureState extends State<ChatBotFeature> {
  final _c = ChatController();
  void _saveHistory(String query, String result) {
    FirebaseFirestore.instance.collection('history').add({
      'query': query,
      'featureType': 'chatbot',
      'result': result,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat with AI Assistant',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.85, // Using MediaQuery directly
              child: TextFormField(
                controller: _c.textC,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  hintText: "Ask me Anything you want...",
                  hintStyle: const TextStyle(fontSize: 14),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          CircleAvatar(
            backgroundColor: Theme.of(context).buttonColor,
            radius: 21,
            child: IconButton(
              onPressed: () {
                final query = _c.textC.text;
                _c.askQuestion();
                _saveHistory(query, ""); // Save the history
              },
              icon: const Icon(
                Icons.rocket_launch_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => ListView(
          physics: const BouncingScrollPhysics(),
          controller: _c.scrollC,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height *
                0.02, // Using MediaQuery directly
            bottom: MediaQuery.of(context).size.height *
                0.1, // Using MediaQuery directly
          ),
          children: _c.list.map((e) => MessageCard(message: e)).toList(),
        ),
      ),
    );
  }
}
