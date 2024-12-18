import 'package:ai_assistant/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ChatBotFeature extends StatefulWidget {
  const ChatBotFeature({super.key});

  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}

class _ChatBotFeatureState extends State<ChatBotFeature> {
  final _c = ChatController();

  @override
  void dispose() {
    // Ensure the controller is disposed properly
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with AI Assistant'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.85, // Adjust percentage for desired width
              child: TextFormField(
                controller: _c.textC,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
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
          const SizedBox(width: 7),
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 24,
            child: IconButton(
              onPressed: _c.askQuestion,
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
          children: _c.list.map((e) => Text(e.msg)).toList(),
        ),
      ),
    );
  }
}
