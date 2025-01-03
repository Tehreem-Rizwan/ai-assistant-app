import 'package:ai_assistant/constants/app_colors.dart';
import 'package:ai_assistant/screens/auth/signin_screen.dart';
import 'package:ai_assistant/screens/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegistrationController extends GetxController {
  // Controllers for TextFields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  var isChecked = false.obs;

  final AuthService _authService = AuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to register user
  void register() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String username = userNameController.text.trim();

    if (email.isNotEmpty &&
        password.isNotEmpty &&
        username.isNotEmpty &&
        isChecked.value) {
      var user = await _authService.registerWithEmailAndPassword(
          email, password, username);
      if (user != null) {
        // Store user information in Firestore
        await _firestore.collection('users').doc(user.uid).set({
          'email': email,
          'username': username,
          'createdAt': Timestamp.now(),
        });

        Get.snackbar("Success", "User Registered Successfully",
            backgroundColor: Colors.green, colorText: kSecondaryColor);

        Get.to(() => SigninScreen(
              userEmail: 'tehreemrizwan30@gmail.com',
            ));
      } else {
        Get.snackbar("Error", "Registration failed. Please try again.",
            backgroundColor: kRedColor, colorText: kSecondaryColor);
      }
    } else {
      Get.snackbar("Error", "Please fill all fields and agree to the terms.",
          backgroundColor: kRedColor, colorText: kSecondaryColor);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    super.dispose();
  }
}
