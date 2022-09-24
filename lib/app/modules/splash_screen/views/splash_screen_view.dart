import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testbintoro/app/config/constant.dart';
import 'package:testbintoro/components/default_text.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        // child: Obx(
        //   () => Visibility(
        //     // visible: controller.showImage.value,
        //     child: AnimatedOpacity(
        //       opacity: controller.showImage.value ? 1.0 : 0.0,
        //       duration: kDefaultDuration,
        //       child: Image.asset(
        //         'assets/icons/logo_test.png',
        //         height: 64,
        //       ),
        //     ),
        //     // replacement: DefText(
        //     //   'Welcome',
        //     //   color: kBgWhite,
        //     // ).large,
        //   ),
        // ),
        child: Obx(
          () => Container(
            height: 70,
            child: AnimatedCrossFade(
              crossFadeState: controller.showImage.isTrue ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: kDefaultDuration,
              alignment: Alignment.center,
              firstCurve: Curves.easeInOutCirc,
              secondCurve: Curves.easeInOutCirc,
              firstChild: Image.asset(
                'assets/icons/logo_test.png',
                height: 64,
              ),
              secondChild: Center(
                child: DefText(
                  'Welcome',
                  color: kBgWhite,
                ).large,
              ),
            ),
          ),
        ),
      ),
      // body: Center(
      //   child: Obx(
      //     () => DefText(controller.text.value).semilarge,
      //   ),
      // ),
    );
  }
}
