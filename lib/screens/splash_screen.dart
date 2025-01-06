import 'package:ai_assistant/constants/app_images.dart';
import 'package:ai_assistant/screens/auth/signin_screen.dart';
import 'package:ai_assistant/screens/helper/pref.dart';
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
      Get.off(() => Pref.showOnboarding
          ? const OnBoardingScreen()
          : SigninScreen(
              userEmail: 'tehreemrizwan30@gmail.com',
            ));
    });
  }

  @override
  Widget build(BuildContext context) {
    // Replaced mq with MediaQuery for height and width
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                padding: EdgeInsets.all(width * 0.05),
                child: Image.asset(
                  Assets.imagesLogo,
                  width: width * .4,
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
