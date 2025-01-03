// import 'dart:developer';

// import 'package:ai_assistant/screens/helper/global.dart';
// import 'package:appwrite/appwrite.dart';

// class AppWrite {
//   static final _client = Client();
//   static final _database = Databases(_client);

//   static void init() {
//     _client
//         .setEndpoint('https://cloud.appwrite.io/v1')
//         .setProject('676d40fa002b1d297c89')
//         .setSelfSigned(status: true);
//     getApiKey();
//   }

//   static Future<String> getApiKey() async {
//     try {
//       final d = await _database.getDocument(
//           databaseId: 'Mydatabase',
//           collectionId: 'Apikey',
//           documentId: 'GeminiApiKey');

//       apiKey = d.data['apiKey'];
//       log(apiKey);
//       return apiKey;
//     } catch (e) {
//       log('$e');
//       return '';
//     }
//   }
// }
