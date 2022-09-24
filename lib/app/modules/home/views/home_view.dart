import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testbintoro/app/config/constant.dart';
import 'package:testbintoro/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: kBgWhite,
        ),
        onPressed: () {
          Get.toNamed(Routes.CREATE_NOTE);
          // controller.notifC.showNotification(
          //   166,
          //   'title',
          //   'description',
          //   Routes.NOTIFICATION_DETAIL,
          // );
          // controller.notifC.scheduleTimer(
          //   scheduled: DateTime(2022, 9, 23, 21, 10),
          //   title: 'asdasdasd',
          //   body: 'wkwkw',
          // );
        },
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
