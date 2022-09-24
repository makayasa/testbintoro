import 'package:get/get.dart';

import '../controllers/create_note_controller.dart';

class CreateNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateNoteController>(
      () => CreateNoteController(),
    );
  }
}
