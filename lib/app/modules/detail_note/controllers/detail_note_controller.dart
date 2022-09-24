import 'package:get/get.dart';
import 'package:testbintoro/utils/function_utils.dart';
import 'package:timezone/timezone.dart' as tz;

class DetailNoteController extends GetxController {
  var arg = {}.obs;

  var notifData = {}.obs;
  var isCalled = false.obs;

  void initialFunction() async {
    if (isNotEmpty(Get.arguments)) {
      arg.assignAll(Get.arguments);
      notifData.assignAll(arg['notification_data']);
      check();
    }
  }

  void check() {
    var notifTime = tz.TZDateTime.parse(tz.local, notifData['time']);
    logKey('notiftime', notifData['time']);
    logKey('isAfter', DateTime.now().isAfter(notifTime));
    if (DateTime.now().isAtSameMomentAs(notifTime) || DateTime.now().isAfter(notifTime)) {
      isCalled.value = true;
    }
  }

  @override
  void onInit() {
    super.onInit();
    initialFunction();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
