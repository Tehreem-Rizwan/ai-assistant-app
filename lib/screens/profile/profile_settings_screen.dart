import 'dart:io';

import 'package:ai_assistant/constants/app_colors.dart';
import 'package:ai_assistant/constants/app_styling.dart';
import 'package:ai_assistant/widgets/Custom_Textfield_widget.dart';
import 'package:ai_assistant/widgets/Custom_text_widget.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  getImage(ImageSource soruce) async {
    final XFile? image = await _picker.pickImage(source: soruce);
    if (image != null) {
      selectedImage = File(image.path);
      print(File);
    }
  }

  uploadImage(File image) async {
    String imageUrl = '';
    String fileName = Path.basename(image.path);
    var reference = FirebaseStorage.instance.ref().child("users/$fileName");
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    await taskSnapshot.ref.getDownloadURL().then((value) => imageUrl = value);
    print("Download Url :$imageUrl");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                getImage(ImageSource.gallery);
              },
              child: selectedImage == null
                  ? Container(
                      width: w(context, 120),
                      height: h(context, 120),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: kGreyColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(Icons.camera_alt,
                            size: 40, color: kWhiteColor),
                      ),
                    )
                  : Container(
                      width: w(context, 120),
                      height: h(context, 120),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(selectedImage!),
                          fit: BoxFit.cover,
                        ),
                        color: kGreyColor,
                        shape: BoxShape.circle,
                      ),
                    ),
            ),
            SizedBox(height: h(context, 12)),
            CustomText(
              text: "Username",
              size: 14,
              weight: FontWeight.w700,
              color: kBlackyColor,
            ),
            SizedBox(height: h(context, 8)),
            CustomTextField(
              controller: nameController,
              hintText: "Enter username",
            ),
            SizedBox(height: h(context, 12)),
            CustomText(
              text: "Email",
              size: 14,
              weight: FontWeight.w700,
              color: kBlackyColor,
            ),
            SizedBox(height: h(context, 8)),
            CustomTextField(
              controller: emailController,
              hintText: "Enter email",
            ),
            SizedBox(height: h(context, 12)),
            CustomText(
              text: "Phone Number",
              size: 14,
              weight: FontWeight.w700,
              color: kBlackyColor,
            ),
            SizedBox(height: h(context, 8)),
            CustomTextField(
              controller: phoneController,
              hintText: "Enter phone No.",
            ),
            SizedBox(height: h(context, 12)),
            Center(
              child: CustomButton(
                height: 52,
                width: 327,
                text: "Register",
                textSize: 14,
                backgroundColor: kTertiaryColor,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
