import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryModel {
  final String query;
  final String featureType;
  final String result;
  final Timestamp timestamp;

  HistoryModel({
    required this.query,
    required this.featureType,
    required this.result,
    required this.timestamp,
  });

  // Factory constructor to create a HistoryModel from Firestore data
  factory HistoryModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // Ensure all fields are extracted with defaults if null
    return HistoryModel(
      query: data['query'] ?? '',
      featureType: data['featureType'] ?? '',
      result: data['result'] ?? '',
      timestamp: data['timestamp'] ??
          Timestamp.now(), // Default to current time if no timestamp
    );
  }

  // Convert the HistoryModel back to a Map to save in Firestore
  Map<String, dynamic> toMap() {
    return {
      'query': query,
      'featureType': featureType,
      'result': result,
      'timestamp': timestamp,
    };
  }
}
