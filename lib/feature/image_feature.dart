import 'package:ai_assistant/controllers/image_controller.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:ai_assistant/widgets/custom_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ai_assistant/screens/helper/global.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lottie/lottie.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  final _c = ImageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'AI Image Creator',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: [
            Obx(
              () => _c.status.value == Status.complete
                  ? IconButton(
                      padding: const EdgeInsets.only(right: 6),
                      onPressed: _c.shareImage,
                      icon: const Icon(Icons.share))
                  : const SizedBox(),
            )
          ],
        ),
        floatingActionButton: Obx(() => _c.status.value == Status.complete
            ? Padding(
                padding: const EdgeInsets.only(right: 6, bottom: 6),
                child: FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: _c.downloadImage,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: const Icon(
                    Icons.save_alt_rounded,
                    size: 26,
                    color: Colors.white,
                  ),
                ),
              )
            : const SizedBox()),
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
              textAlign: TextAlign.center,
              minLines: 2,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                  hintText:
                      'Imagine something wonderful & innovative\nType here & I will create for you 😃',
                  hintStyle: TextStyle(fontSize: 13.5),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            Container(
                height: mq.height * 0.5,
                margin: EdgeInsets.symmetric(vertical: mq.height * .015),
                alignment: Alignment.center,
                child: Obx(() => _aiImage())),
            Obx(() => _c.imageList.isEmpty
                ? const SizedBox()
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(bottom: mq.height * .03),
                    physics: const BouncingScrollPhysics(),
                    child: Wrap(
                      spacing: 10,
                      children: _c.imageList
                          .map((e) => InkWell(
                                onTap: () {
                                  _c.url.value = e;
                                },
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  child: CachedNetworkImage(
                                    imageUrl: e,
                                    height: 100,
                                    errorWidget: (context, url, error) =>
                                        const SizedBox(),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  )),
            CustomButton(
              text: "Create",
              onTap: _c.searchAiImage,
              height: 52,
              textSize: 16,
              backgroundColor: Colors.blue,
              width: 140,
            )
          ],
        ));
  }

  Widget _aiImage() => ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: switch (_c.status.value) {
        Status.none => Lottie.asset(
            "assets/lottie/ai_play.json",
            height: mq.height * 0.3,
          ),
        Status.complete => CachedNetworkImage(
            imageUrl: _c.url.value,
            placeholder: (context, url) => CustomLoading(),
            errorWidget: (context, url, error) => SizedBox(),
          ),
        Status.loading => CustomLoading()
      });
}
