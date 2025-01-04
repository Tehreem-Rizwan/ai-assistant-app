import 'package:ai_assistant/main.dart';
import 'package:ai_assistant/screens/auth/signin_screen.dart';
import 'package:ai_assistant/screens/helper/global.dart';
import 'package:ai_assistant/screens/home_page.dart';
import 'package:ai_assistant/screens/model/onboard.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    final list = [
      Onboard(
          title: 'Ask me Anything',
          subtitle:
              'I can be your Best Friend & You can ask me\nanything & I will help you!!!',
          lottie: 'ai_ask_me'),
      Onboard(
          title: 'Imagination to Reality',
          subtitle:
              'Just imagine anything and let me know, I will\ncreate something wonderful for you!!!',
          lottie: 'ai_play')
    ];
    return Scaffold(
        body: PageView.builder(
            controller: controller,
            itemCount: list.length,
            itemBuilder: (ctx, ind) {
              final isLast = ind == list.length - 1;
              return Column(
                children: [
                  Lottie.asset(
                    "assets/lottie/${list[ind].lottie}.json",
                    height: mq.height * 0.6,
                    width: isLast ? mq.width * 0.7 : null,
                    repeat: true,
                  ),
                  Text(list[ind].title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.5)),
                  SizedBox(
                    height: mq.height * 0.015,
                  ),
                  SizedBox(
                    height: mq.height * 0.07,
                    child: Text(list[ind].subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.5,
                            color: Theme.of(context).lightTextColor)),
                  ),
                  Spacer(),
                  Wrap(
                      spacing: 10,
                      children: List.generate(
                          list.length,
                          (i) => Container(
                                width: i == ind ? 15 : 10,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: i == ind ? Colors.blue : Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                              ))),
                  Spacer(),
                  CustomButton(
                    onTap: () {
                      if (isLast) {
                        Get.to(() => SigninScreen(
                              userEmail: 'tehreemrizwan30@gmail.com',
                            ));
                      } else {
                        controller.nextPage(
                            duration: Duration(milliseconds: 600),
                            curve: Curves.ease);
                      }
                    },
                    text: isLast ? "Finish" : "Next",
                    height: 52,
                    textSize: 16,
                    backgroundColor: Colors.blue,
                    width: 150,
                  ),
                  Spacer(
                    flex: 2,
                  ),
                ],
              );
            }));
  }
}
