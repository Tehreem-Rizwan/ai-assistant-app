import 'package:ai_assistant/controllers/image_controller.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:ai_assistant/screens/helper/global.dart';
import 'package:lottie/lottie.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  @override
  Widget build(BuildContext context) {
    final _c = ImageController();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'AI Image Creator',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
              top: mq.height * 0.02,
              bottom: mq.height * 0.1,
              left: mq.width * 0.04,
              right: mq.width * 0.04),
          children: [
            TextFormField(
              controller: _c.textC,
              minLines: 2,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                filled: true,
                hintText:
                    "Imagine something wonderful and innovative \n Type here and i will create for you 😄",
                hintStyle: const TextStyle(fontSize: 14),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
            Container(
                height: mq.height * 0.5,
                alignment: Alignment.center,
                child: Lottie.asset(
                  "assets/lottie/ai_play.json",
                  height: mq.height * 0.3,
                )),
            CustomButton(
              text: "Create",
              onTap: () {},
            )
          ],
        ));
  }
}
