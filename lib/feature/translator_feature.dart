import 'package:ai_assistant/controllers/image_controller.dart';
import 'package:ai_assistant/controllers/translate_controller.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:ai_assistant/widgets/custom_loading.dart';
import 'package:ai_assistant/widgets/language_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  final _c = TranslateController();

  void _saveHistory(String query, String result) {
    FirebaseFirestore.instance.collection('history').add({
      'query': query,
      'featureType': 'AI translator',
      'result': result,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi-Language Translator'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: height * 0.02,
          bottom: height * 0.1,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(c: _c, s: _c.from)),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Container(
                  height: 50,
                  width: width * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child:
                      Obx(() => Text(_c.from.isEmpty ? 'Auto' : _c.from.value)),
                ),
              ),
              IconButton(
                onPressed: _c.swapLanguages,
                icon: Obx(
                  () => Icon(
                    CupertinoIcons.repeat,
                    color: _c.to.isNotEmpty && _c.from.isNotEmpty
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
              ),
              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(c: _c, s: _c.to)),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Container(
                  height: 50,
                  width: width * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Obx(() => Text(_c.to.isEmpty ? 'To' : _c.to.value)),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * .04, vertical: height * .035),
            child: TextFormField(
              controller: _c.textC,
              minLines: 5,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                  hintText: 'Translate anything you want...',
                  hintStyle: TextStyle(fontSize: 13.5),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          Obx(() => _translateResult()),
          SizedBox(height: height * 0.04),
          CustomButton(
            onTap: () async {
              await _c.googleTranslate();
              if (_c.resultC.text.isNotEmpty) {
                _saveHistory(_c.textC.text, _c.resultC.text);
              }
            },
            text: "Translate",
            height: 52,
            textSize: 16,
            backgroundColor: Colors.blue,
            width: 140,
          ),
        ],
      ),
    );
  }

  Widget _translateResult() => switch (_c.status.value) {
        Status.none => const SizedBox(),
        Status.complete => Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .04),
            child: TextFormField(
              controller: _c.resultC,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
        Status.loading => const Align(child: CustomLoading())
      };
}
