import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryModel {
  final String query;
  final String featureType; // chatbot, image, or translation
  final String result;
  final Timestamp timestamp; // timestamp to store the time

  HistoryModel({
    required this.query,
    required this.featureType,
    required this.result,
    required this.timestamp,
  });

  // Convert Firestore Document to HistoryModel
  factory HistoryModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return HistoryModel(
      query: data['query'] ?? '',
      featureType: data['featureType'] ?? '',
      result: data['result'] ?? '',
      timestamp: data['timestamp'] ?? Timestamp.now(),
    );
  }

  // Convert HistoryModel to Firestore Document format
  Map<String, dynamic> toMap() {
    return {
      'query': query,
      'featureType': featureType,
      'result': result,
      'timestamp': timestamp,
    };
  }
}
