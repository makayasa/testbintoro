import 'package:get/get.dart';

import '../controllers/notification_detail_controller.dart';

class NotificationDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationDetailController>(
      () => NotificationDetailController(),
    );
  }
}
