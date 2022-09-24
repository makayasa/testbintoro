import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_detail_controller.dart';

class NotificationDetailView extends GetView<NotificationDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotificationDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NotificationDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
