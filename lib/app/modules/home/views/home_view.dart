import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testbintoro/app/config/constant.dart';
import 'package:testbintoro/app/routes/app_pages.dart';
import 'package:testbintoro/components/default_text.dart';
import 'package:testbintoro/utils/function_utils.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
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
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            GetX<HomeController>(
              init: HomeController(),
              builder: (ctrl) {
                return ListView.separated(
                  shrinkWrap: true,
                  padding: kDefSidePadding,
                  itemCount: ctrl.listNotes.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    return Material(
                      elevation: 2.4,
                      borderRadius: kDefaultBorderRadius,
                      child: InkWell(
                        onTap: () {},
                        onLongPress: () {
                          ctrl.deleteNotes(index);
                        },
                        borderRadius: kDefaultBorderRadius,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.6),
                            borderRadius: kDefaultBorderRadius,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefText(ctrl.listNotes[index]['title']).normal,
                              SizedBox(height: 10),
                              DefText(
                                dateFormater(ctrl.listNotes[index]['time']),
                              ).normal,
                              SizedBox(height: 10),
                              DefText(ctrl.listNotes[index]['description']).normal,
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
