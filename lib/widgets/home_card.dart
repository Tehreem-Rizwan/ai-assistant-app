import 'package:ai_assistant/screens/helper/ad_helper.dart';
import 'package:ai_assistant/screens/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;
  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;

    // Getting screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      color: Colors.blue.withOpacity(0.2),
      elevation: 0,
      margin:
          EdgeInsets.only(bottom: screenHeight * 0.02), // Using screenHeight
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          onTap: () => AdHelper.showInterstitialAd((homeType.OnTap)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: homeType.leftAlign
                ? [
                    Transform.scale(
                      scale: homeType == HomeType.aiImage ? 0.7 : 1.0,
                      child: SizedBox(
                        width: screenWidth * 0.3, // Using screenWidth
                        child: Lottie.asset("assets/lottie/${homeType.lottie}"),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        homeType.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]
                : [
                    Expanded(
                      child: Text(
                        homeType.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Transform.scale(
                      scale: homeType == HomeType.aiImage ? 0.7 : 1.0,
                      child: SizedBox(
                        width: screenWidth * 0.3, // Using screenWidth
                        child: Lottie.asset("assets/lottie/${homeType.lottie}"),
                      ),
                    ),
                  ],
          ),
        ),
      ),
    ).animate().fade(duration: 1.seconds, curve: Curves.easeIn);
  }
}
