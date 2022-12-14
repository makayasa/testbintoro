import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:testbintoro/app/config/constant.dart';
import 'package:testbintoro/app/controllers/notification_controller.dart';
import 'package:testbintoro/app/routes/app_pages.dart';
import 'package:testbintoro/components/default_dialog.dart';

import '../../../../utils/function_utils.dart';

class HomeController extends GetxController {
  var notifC = Get.find<NotificationController>();
  var box = GetStorage();
  var arg = {}.obs;

  var listNotes = [].obs;

  Future<void> getNotes() async {
    var res = await box.read(kNotes) ?? [];
    listNotes.assignAll(res);
  }

  void createNote() async {
    await Get.toNamed(Routes.CREATE_NOTE);
    await getNotes();
  }

  void toDetailNote(int index) {
    Get.toNamed(
      Routes.DETAIL_NOTE,
      arguments: {
        'notification_data': listNotes[index],
      },
    );
  }

  void deleteNotes(int index) async {
    // Get.defaultDialog();
    Get.dialog(
      DefaultDialog(
        title: 'Perhatian!',
        errorMessage: 'Anda yakin ingin menghapus catatan ini ?',
        cancelText: 'Batal',
        confirmText: 'Hapus',
        onConfirm: () async {
          await notifC.cancelScheduledNotif(listNotes[index]['notification_id']);
          await notifC.cancelScheduledNotif(listNotes[index]['notification_id'] + reminderBaseNotifId);

          List tempNotes = await box.read(kNotes);
          //* ini bakal error kalau ada fitur sort
          tempNotes.removeAt(index);
          box.write(kNotes, tempNotes);
          listNotes.removeAt(index);
          Get.back();
        },
      ),
    );
  }

  void showInformation() {
    Get.dialog(
      DefaultDialog(
        title: 'Informasi',
        errorMessage: 'Tekan agak lama untuk menghapus',
        onConfirm: () {
          Get.back();
        },
        isOneButton: true,
      ),
    );
  }

  void initialFunction() async {
    if (isNotEmpty(Get.arguments)) {
      arg.assignAll(Get.arguments);
      if (isNotEmpty(arg['payload'])) {
        Get.toNamed(
          Routes.DETAIL_NOTE,
          arguments: {
            'notification_data': json.decode(arg['payload']),
          },
        );
      }
    }
    await getNotes();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initialFunction();
  }

  @override
  void onClose() {}
}
