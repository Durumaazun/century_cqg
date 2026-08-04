import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:century_cqg/Helper/nerve_enum.dart';

class AppConfig {
  static AppConfig? _singleton;
  AppPlatform currentPlatform = AppPlatform.web;

  factory AppConfig() {
    //return _singleton;

    if (_singleton == null) {
      _singleton = AppConfig._internal();

      return _singleton!;
    } else {
      return _singleton!;
    }
  }

  AppConfig._internal() {
    if (kIsWeb) {
      currentPlatform = AppPlatform.web;
    } else {
      if ((Platform.isIOS) || (Platform.isAndroid)) {
        currentPlatform = AppPlatform.mobile;
      }
    }
  }
}
