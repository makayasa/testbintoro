import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:testbintoro/app/config/constant.dart';
import 'package:testbintoro/components/default_text.dart';
import 'package:testbintoro/components/input_builder.dart';
import 'package:testbintoro/components/primary_button.dart';

import '../../../../components/setting_datetime.dart';
import '../../../../utils/function_utils.dart';
import '../controllers/create_note_controller.dart';

class CreateNoteView extends GetView<CreateNoteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Obx(
        (() => DefText(
              controller.title.value,
              color: kBgWhite,
            ).large),
      )),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: kDefSidePadding,
        child: FormBuilder(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              DefText(
                'Judul',
                fontWeight: FontWeight.bold,
              ).normal,
              SizedBox(height: 10),
              InputBuilderText(
                name: 'title',
                hint: '',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                  borderRadius: kDefaultBorderRadius,
                ),
              ),
              SizedBox(height: 20),
              DefText(
                'Waktu',
                fontWeight: FontWeight.bold,
              ).normal,
              SizedBox(height: 10),
              FormBuilderDateTimePicker(
                name: 'time',
                style: TextStyle(fontSize: 14),
                format: DateFormat("dd MMM yyyy - kk:mm"),
                locale: Locale('id', 'ID'),
                firstDate: DateTime.now(),
                initialTime: TimeOfDay.now(),
                inputType: InputType.both,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  contentPadding: EdgeInsets.only(
                    left: 8,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              SizedBox(height: 20),
              DefText(
                'Deskripsi',
                fontWeight: FontWeight.bold,
              ).normal,
              SizedBox(height: 10),
              InputBuilderText(
                name: 'description',
                hint: '',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                  borderRadius: kDefaultBorderRadius,
                ),
              ),
              Spacer(),
              PrimaryButton(
                text: 'Simpan',
                press: () {
                  controller.saveNote();
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
