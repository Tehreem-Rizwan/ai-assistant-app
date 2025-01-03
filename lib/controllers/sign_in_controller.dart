import 'package:ai_assistant/screens/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var emailError = false.obs;
  var passwordError = false.obs;
  var errorMessage = ''.obs;
  var emailErrorText = ''.obs;
  var passwordErrorText = ''.obs;

  Future<void> signIn() async {
    emailError.value = false;
    passwordError.value = false;

    if (emailController.text.isEmpty) {
      emailError.value = true;
      emailErrorText.value = "";
      return;
    } else if (passwordController.text.isEmpty) {
      passwordError.value = true;
      passwordErrorText.value = "Password cannot be empty";
      return;
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      User? user = userCredential.user;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'email': user.email,
          'uid': user.uid,
          'createdAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));

        Get.to(() => HomePage());
      }
    } catch (e) {
      emailError.value = true;
      emailErrorText.value = "Email not found";
      passwordError.value = true;
      passwordErrorText.value = "";
    }
  }
}
