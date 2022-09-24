import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import '../app/config/constant.dart';
import 'default_text.dart';

class SettingDateTime extends StatelessWidget {
  const SettingDateTime({
    Key? key,
    required this.icon,
    required this.title,
    required this.entryMode,
    required this.inputType,
    required this.format,
    required this.initialValue,
    this.onChanged,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Function(DateTime?)? onChanged;
  final DatePickerEntryMode entryMode;
  final InputType inputType;
  final DateFormat format;
  final DateTime initialValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: kPrimaryColor,
        ),
        SizedBox(width: 10),
        DefText(title).semilarge,
        Spacer(),
        Expanded(
          flex: 10,
          child: FormBuilderDateTimePicker(
            initialDate: DateTime.now(),
            onChanged: onChanged,
            textAlign: TextAlign.end,
            name: 'date',
            style: TextStyle(
              fontSize: 15.7,
            ),
            initialEntryMode: entryMode,
            inputType: inputType,
            format: format,
            initialValue: initialValue,
            firstDate: DateTime.now(),
            autovalidateMode: AutovalidateMode.always,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }
}
