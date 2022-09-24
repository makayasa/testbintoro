import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/function_utils.dart';
import '../../../config/constant.dart';

class CreateNoteController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  var box = GetStorage();

  var title = 'Buat Pengingat'.obs;

  void saveNote() async {
    if (formKey.currentState!.saveAndValidate()) {
      var reformat = {
        'title': formKey.currentState!.fields['title']!.value,
        'time': '${formKey.currentState!.fields['time']!.value}',
        'description': formKey.currentState!.fields['description']!.value
      };
      List tempNotes = await box.read(kNotes) ?? [];
      tempNotes.add(reformat);
      box.write(kNotes, tempNotes);
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
