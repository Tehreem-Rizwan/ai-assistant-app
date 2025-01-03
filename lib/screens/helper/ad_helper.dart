import 'dart:developer';

import 'package:ai_assistant/screens/helper/my_dialogue.dart';
import 'package:easy_audience_network/easy_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdHelper {
  static void init() {
    EasyAudienceNetwork.init(
      testMode: true,
    );
  }

  static void showInterstitialAd(VoidCallback onComplete) {
    MyDialog.showLoadingDialog();

    final interstitialAd = InterstitialAd(InterstitialAd.testPlacementId);

    interstitialAd.listener = InterstitialAdListener(onLoaded: () {
      Get.back();
      onComplete();

      interstitialAd.show();
    }, onDismissed: () {
      interstitialAd.destroy();
    }, onError: (i, e) {
      Get.back();
      onComplete();

      log('interstitial error: $e');
    });

    interstitialAd.load();
  }

  static Widget nativeAd() {
    return SafeArea(
      child: NativeAd(
        placementId: NativeAd.testPlacementId,
        adType: NativeAdType.NATIVE_AD,
        keepExpandedWhileLoading: false,
        expandAnimationDuraion: 1000,
        listener: NativeAdListener(
          onError: (code, message) => log('error'),
          onLoaded: () => log('loaded'),
          onClicked: () => log('clicked'),
          onLoggingImpression: () => log('logging impression'),
          onMediaDownloaded: () => log('media downloaded'),
        ),
      ),
    );
  }

  static Widget nativeBannerAd() {
    return SafeArea(
      child: NativeAd(
        placementId: NativeAd.testPlacementId,
        adType: NativeAdType.NATIVE_BANNER_AD,
        bannerAdSize: NativeBannerAdSize.HEIGHT_100,
        keepExpandedWhileLoading: false,
        height: 100,
        expandAnimationDuraion: 1000,
        listener: NativeAdListener(
          onError: (code, message) => log('error'),
          onLoaded: () => log('loaded'),
          onClicked: () => log('clicked'),
          onLoggingImpression: () => log('logging impression'),
          onMediaDownloaded: () => log('media downloaded'),
        ),
      ),
    );
  }
}
