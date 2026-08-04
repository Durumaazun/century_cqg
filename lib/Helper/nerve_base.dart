import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NerveBase {
  BuildContext? loaderContext;

  // Singleton object
  static final NerveBase _singleton = NerveBase._internal();

  factory NerveBase() {
    return _singleton;
  }

  NerveBase._internal();

  double screenWidth = 0.0;
  // double screenHeight = 0.0;
  bool isWeb = false;

  bool isDarkMode = false;
  void getScreenSize(double screenW, bool isOld) {
    if (isOld) {
      if ((screenW - 100) < 1480) {
        screenWidth = 1480;
      } else {
        screenWidth = (screenW - 100);
      }
    } else {
      if (screenW < 1480) {
        screenWidth = 1480;
      } else {
        screenWidth = screenW;
      }
    }
    if (kDebugMode) {
      print("Screennnn widthh $screenWidth || 0");
    }
  }

  void clearImageCache() {
    imageCache.clear();
    imageCache.clearLiveImages();
  }
}
