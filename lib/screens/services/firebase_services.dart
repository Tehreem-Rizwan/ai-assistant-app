// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'dart:io';

// import 'package:foodapp/view/screens/cart/cart_item_model.dart';

// class FirebaseService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;

//   Future<void> storeOrderData({
//     required List<CartItemModel> cartItems,
//     required String name,
//     required String phone,
//     required String address,
//     required String houseNo,
//     required String city,
//     required double totalPrice,
//   }) async {
//     // Store the order details in Firestore
//     await _firestore.collection('orders').add({
//       'name': name,
//       'phone': phone,
//       'address': address,
//       'houseNo': houseNo,
//       'city': city,
//       'totalPrice': totalPrice,
//       'orderItems': cartItems
//           .map((item) => {
//                 'name': item.name,
//                 'price': item.price,
//                 'imageUrl': item
//                     .imagePath, // Image path will be updated later after upload
//               })
//           .toList(),
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//   }

//   Future<String> uploadImage(File imageFile) async {
//     // Upload an image to Firebase Storage
//     String fileName = imageFile.path.split('/').last;
//     Reference storageRef = _storage.ref().child('order_images/$fileName');
//     UploadTask uploadTask = storageRef.putFile(imageFile);

//     TaskSnapshot snapshot = await uploadTask;
//     return await snapshot.ref.getDownloadURL(); // Get image URL after upload
//   }
// }
