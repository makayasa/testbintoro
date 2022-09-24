import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:testbintoro/app/modules/home/controllers/home_controller.dart';

import '../../../../components/default_text.dart';
import '../../../../utils/function_utils.dart';
import '../../../config/constant.dart';

class CardNote extends GetView<HomeController> {
  const CardNote({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.2),
        borderRadius: kDefaultBorderRadius,
        border: Border.all(
          color: kPrimaryColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefText(controller.listNotes[index]['title']).normal,
          SizedBox(height: 10),
          DefText(
            dateFormater(controller.listNotes[index]['time']),
          ).normal,
          SizedBox(height: 10),
          DefText(controller.listNotes[index]['description']).normal,
        ],
      ),
    );
  }
}
