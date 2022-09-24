import 'package:get/get.dart';
import 'package:testbintoro/app/controllers/notification_controller.dart';

class HomeController extends GetxController {
  var notifC = Get.find<NotificationController>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
