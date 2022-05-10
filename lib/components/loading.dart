import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Loading {
  void config() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.pulse
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 60.0
      ..radius = 10.0
      ..progressColor = Colors.grey
      ..backgroundColor = Colors.grey[300]
      ..indicatorColor = Colors.white
      ..textColor = Colors.black
      ..maskType = EasyLoadingMaskType.black
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  void show(String text) {
    EasyLoading.show(status: text);
  }

  void success(String text) {
    EasyLoading.showSuccess(text, dismissOnTap: true);
  }

  void error(String text) {
    EasyLoading.showError(text, dismissOnTap: true);
  }

  void hide() {
    EasyLoading.dismiss();
  }
}
