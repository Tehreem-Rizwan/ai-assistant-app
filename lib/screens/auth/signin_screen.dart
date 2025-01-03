import 'package:ai_assistant/constants/app_colors.dart';
import 'package:ai_assistant/constants/app_fonts.dart';
import 'package:ai_assistant/constants/app_styling.dart';
import 'package:ai_assistant/screens/auth/forgot_password_selection.dart';
import 'package:ai_assistant/screens/auth/registration_Screen.dart';
import 'package:ai_assistant/screens/home_page.dart';
import 'package:ai_assistant/widgets/Custom_Textfield_widget.dart';
import 'package:ai_assistant/widgets/Custom_text_widget.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SigninScreen extends StatefulWidget {
  final String userEmail;

  SigninScreen({Key? key, required this.userEmail}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool emailError = false;
  bool passwordError = false;
  String errorMessage = '';
  String emailErrorText = '';
  String passwordErrorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Padding(
        padding: symmetric(
          context,
          horizontal: 24,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h(context, 70)),
              CustomText(
                text: "Login to your account",
                size: 32,
                weight: FontWeight.w600,
                color: kBlackyColor,
              ),
              SizedBox(height: h(context, 8)),
              CustomText(
                text: "Please sign in to your account",
                size: 14,
                weight: FontWeight.w500,
                color: kgreyblackColor,
              ),
              SizedBox(height: h(context, 28)),
              CustomText(
                text: "Email Address",
                size: 14,
                weight: FontWeight.w700,
                color: kBlackyColor,
              ),
              SizedBox(height: h(context, 8)),
              CustomTextField(
                controller: emailController,
                hintText: "Enter email",
                hasError: emailError,
                errorText: emailError ? emailErrorText : null,
              ),
              if (emailError)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CustomText(
                    text: 'Email not found or incorrect',
                    size: 12,
                    color: Colors.red,
                  ),
                ),
              SizedBox(height: h(context, 25)),
              CustomText(
                text: "Password",
                size: 14,
                weight: FontWeight.w700,
                color: kBlackyColor,
              ),
              SizedBox(height: h(context, 8)),
              CustomTextField(
                controller: passwordController,
                hintText: "Password",
                isIcon: true,
                obscureText: true,
                hasError: passwordError,
                errorText: passwordError ? passwordErrorText : null,
              ),
              if (passwordError)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CustomText(
                    text: 'Password is incorrect',
                    size: 12,
                    color: Colors.red,
                  ),
                ),
              SizedBox(height: h(context, 16)),
              GestureDetector(
                onTap: () {
                  // Use widget.userEmail instead of userEmail
                  if (widget.userEmail.isNotEmpty) {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          width: double.infinity,
                          height: h(context, 420), // Adjust height as needed
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(h(context, 28)),
                              topRight: Radius.circular(h(context, 28)),
                            ),
                            color: kSecondaryColor,
                          ),
                          child: ForgotPasswordSelection(
                              userEmail: widget.userEmail), // Correct usage
                        );
                      },
                    );
                  } else {
                    // Handle the case where userEmail is null or empty
                    print("No user email available.");
                  }
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: "Forgot Password",
                    fontFamily: AppFonts.Inter,
                    size: 14,
                    weight: FontWeight.w500,
                    color: kTertiaryColor,
                  ),
                ),
              ),
              SizedBox(height: h(context, 28)),
              Center(
                child: CustomButton(
                    height: 52,
                    width: 140,
                    text: "Sign In",
                    textSize: 14,
                    backgroundColor: Colors.blue,
                    onTap: () async {
                      emailError = false;
                      passwordError = false;

                      if (emailController.text.isEmpty) {
                        setState(() {
                          emailError = true;
                          emailErrorText = "Please enter an email address.";
                        });
                      } else if (passwordController.text.isEmpty) {
                        setState(() {
                          passwordError = true;
                          passwordErrorText = "Please enter your password.";
                        });
                      } else {
                        try {
                          UserCredential userCredential =
                              await _auth.signInWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );

                          User? user = userCredential.user;
                          if (user != null) {
                            await _firestore
                                .collection('users')
                                .doc(user.uid)
                                .set({
                              'email': user.email,
                              'uid': user.uid,
                              'createdAt': FieldValue.serverTimestamp(),
                            }, SetOptions(merge: true));

                            Get.to(() => HomePage());
                          }
                        } catch (e) {
                          setState(() {
                            emailError = true;
                            emailErrorText = "";
                            passwordError =
                                true; // Only set password error if appropriate
                          });
                        }
                      }
                    }),
              ),
              SizedBox(height: h(context, 30)),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Do not have an account?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: kBlackyColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Register",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: kTertiaryColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(() => RegistrationScreen());
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
