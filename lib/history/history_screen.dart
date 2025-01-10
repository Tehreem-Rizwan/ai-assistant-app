import 'package:ai_assistant/screens/model/data_model_history.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // To format the timestamp

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  String formatTimestamp(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    DateTime now = DateTime.now();
    Duration difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today at ${DateFormat.jm().format(date)}';
    } else if (difference.inDays == 1) {
      return 'Yesterday at ${DateFormat.jm().format(date)}';
    } else if (difference.inDays <= 7) {
      return '${difference.inDays} days ago at ${DateFormat.jm().format(date)}';
    } else {
      return DateFormat.yMMMd().add_jm().format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('history')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No history found.'));
          }
          final historyDocs = snapshot.data!.docs;

          // Debugging: Print each document data
          for (var doc in historyDocs) {
            print(doc.data());
          }

          return ListView.builder(
            itemCount: historyDocs.length,
            itemBuilder: (context, index) {
              var history = HistoryModel.fromFirestore(historyDocs[index]);
              var formattedTime = formatTimestamp(history.timestamp);
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatDetailScreen(history: history),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            history.query,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text("Feature: ${history.featureType}"),
                          const SizedBox(height: 8.0),
                          Text("Result: ${history.result}"),
                          const SizedBox(height: 8.0),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              formattedTime,
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatDetailScreen extends StatelessWidget {
  final HistoryModel history;

  const ChatDetailScreen({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              history.query,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text("Feature: ${history.featureType}"),
            const SizedBox(height: 16.0),
            Text("Result: ${history.result}"),
          ],
        ),
      ),
    );
  }
}
