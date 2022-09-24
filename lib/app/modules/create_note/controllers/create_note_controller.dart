import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:testbintoro/app/controllers/notification_controller.dart';

import '../../../../utils/function_utils.dart';
import '../../../config/constant.dart';

class CreateNoteController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  var notifC = Get.find<NotificationController>();
  var box = GetStorage();

  var title = 'Buat Pengingat'.obs;
  var isReminded = false.obs;

  void saveNote() async {
    if (formKey.currentState!.saveAndValidate()) {
      List tempIds = await box.read(kNotifId) ?? [];
      int notif_id = baseNotifId + tempIds.length + 1;
      tempIds.add(notif_id);
      var reformat = {
        'notification_id': notif_id,
        'title': formKey.currentState!.fields['title']!.value,
        'time': '${formKey.currentState!.fields['time']!.value}',
        'description': formKey.currentState!.fields['description']!.value,
      };
      List tempNotes = await box.read(kNotes) ?? [];
      tempNotes.add(reformat);
      box.write(kNotes, tempNotes);
      box.write(kNotifId, tempIds);

      //* set jadwal timer
      //* kalau isReminded namun waktu sekarang kurang dari 5 menit, maka reminder tidak akan dibuat
      notifC.scheduledNotification(
        id: notif_id,
        scheduled: formKey.currentState!.fields['time']!.value,
        title: formKey.currentState!.fields['title']!.value,
        body: formKey.currentState!.fields['description']!.value,
        setReminder: isReminded.value,
      );

      Get.back();
    }
  }

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
}
