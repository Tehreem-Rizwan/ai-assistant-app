import 'package:ai_assistant/screens/helper/global.dart';
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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      color: Colors.blue.withOpacity(0.2),
      elevation: 0,
      margin: EdgeInsets.only(bottom: mq.height * 0.01),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          onTap: homeType.OnTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: homeType.leftAlign
                ? [
                    Transform.scale(
                      scale: homeType == HomeType.aiImage ? 0.7 : 1.0,
                      child: SizedBox(
                        width: mq.width * 0.3,
                        child: Lottie.asset("assets/lottie/${homeType.lottie}"),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        homeType.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
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
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Transform.scale(
                      scale: homeType == HomeType.aiImage ? 0.7 : 1.0,
                      child: SizedBox(
                        width: mq.width * 0.3,
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
