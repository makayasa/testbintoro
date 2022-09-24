import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testbintoro/components/default_text.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => DefText(controller.text.value).semilarge,
        ),
      ),
    );
  }
}
