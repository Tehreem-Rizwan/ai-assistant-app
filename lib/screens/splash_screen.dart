import 'package:ai_assistant/constants/app_images.dart';
import 'package:ai_assistant/screens/helper/global.dart';
import 'package:ai_assistant/screens/helper/pref.dart';
import 'package:ai_assistant/screens/home_page.dart';
import 'package:ai_assistant/screens/onBoarding_screen.dart';
import 'package:ai_assistant/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Get.off(() =>
          Pref.showOnboarding ? const OnBoardingScreen() : const HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(mq.width * 0.05),
                child: Image.asset(
                  Assets.imagesLogo,
                  width: mq.width * .4,
                ),
              ),
            ),
            Spacer(),
            CustomLoading(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
