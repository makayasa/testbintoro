import 'package:get/get.dart';

import 'package:testbintoro/app/modules/create_note/bindings/create_note_binding.dart';
import 'package:testbintoro/app/modules/create_note/views/create_note_view.dart';
import 'package:testbintoro/app/modules/home/bindings/home_binding.dart';
import 'package:testbintoro/app/modules/home/views/home_view.dart';
import 'package:testbintoro/app/modules/notification_detail/bindings/notification_detail_binding.dart';
import 'package:testbintoro/app/modules/notification_detail/views/notification_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_DETAIL,
      page: () => NotificationDetailView(),
      binding: NotificationDetailBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_NOTE,
      page: () => CreateNoteView(),
      binding: CreateNoteBinding(),
    ),
  ];
}
