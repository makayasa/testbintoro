import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testbintoro/app/config/constant.dart';
import 'package:testbintoro/app/modules/home/components/card_note.dart';
import 'package:testbintoro/components/default_text.dart';
import 'package:testbintoro/utils/function_utils.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefText(
          'Test App',
          color: kBgWhite,
        ).large,
        actions: [
          GestureDetector(
            onTap: controller.showInformation,
            child: Icon(Icons.info_outline_rounded),
          ),
          SizedBox(width: 20),
        ],
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: kBgWhite,
        ),
        onPressed: () {
          controller.createNote();
          // controller.notifC.showNotification(
          //   166,
          //   'title',
          //   'description',
          //   Routes.NOTIFICATION_DETAIL,
          // );
          // controller.notifC.scheduleTimer(
          //   scheduled: DateTime(2022, 9, 23, 21, 10),
          //   title: 'asdasdasd',
          //   body: 'wkwkw',
          // );
        },
      ),
      body: GetX<HomeController>(
        init: HomeController(),
        builder: (ctrl) {
          return ListView.separated(
            padding: kDefSidePadding.copyWith(top: 20, bottom: 100),
            itemCount: ctrl.listNotes.length,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            },
            itemBuilder: (context, index) {
              return Material(
                elevation: 2.4,
                borderRadius: kDefaultBorderRadius,
                child: InkWell(
                  onTap: () {
                    ctrl.toDetailNote(index);
                  },
                  onLongPress: () {
                    ctrl.deleteNotes(index);
                  },
                  borderRadius: kDefaultBorderRadius,
                  child: CardNote(
                    index: index,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
