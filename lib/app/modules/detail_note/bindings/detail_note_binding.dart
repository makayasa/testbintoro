import 'package:get/get.dart';

import '../controllers/detail_note_controller.dart';

class DetailNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailNoteController>(
      () => DetailNoteController(),
    );
  }
}
