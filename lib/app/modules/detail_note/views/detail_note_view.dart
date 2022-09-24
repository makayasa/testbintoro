import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testbintoro/app/config/constant.dart';
import 'package:testbintoro/components/default_text.dart';
import 'package:testbintoro/utils/function_utils.dart';

import '../controllers/detail_note_controller.dart';

class DetailNoteView extends GetView<DetailNoteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => DefText(controller.notifData['title'], color: kBgWhite).large,
        ),
      ),
      body: Container(
        padding: kDefSidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                DefText('Terpanggil : ').normal,
                SizedBox(width: 5),
                Obx(
                  () => DefText(
                    '${controller.isCalled.value}',
                    color: controller.isCalled.value ? Colors.green : Colors.red,
                  ).normal,
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 5),
              child: DefText('Waktu :').normal,
            ),
            SizedBox(height: 10),
            Obx(
              () => Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor),
                  borderRadius: kDefaultBorderRadius,
                ),
                child: DefText(
                  dateFormater(controller.notifData['time']),
                ).normal,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 5),
              child: DefText('Deskripsi :').normal,
            ),
            SizedBox(height: 10),
            Obx(
              () => Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor),
                  borderRadius: kDefaultBorderRadius,
                ),
                child: DefText(
                  controller.notifData['description'],
                ).normal,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
