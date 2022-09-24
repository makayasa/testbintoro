import 'package:get/get.dart';
import 'package:testbintoro/app/controllers/notification_controller.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationController());
  }
}
