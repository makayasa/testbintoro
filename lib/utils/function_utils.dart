import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'package:timezone/timezone.dart' as tz;

import '../app/config/constant.dart';
import '../app/routes/app_pages.dart';

void logKey([key, content]) {
  String finalLog = '';
  dynamic tempContent = content ?? key;
  if (tempContent is Map || tempContent is List) {
    finalLog = json.encode(tempContent);
  } else if (tempContent is String) {
    finalLog = tempContent;
  } else {
    finalLog = tempContent.toString();
  }

  if (content != null) {
    log('$key => $finalLog');
  } else {
    log(finalLog);
  }
}

String dateFormater(
  dynamic date, {
  String dateFormat = "EEEE, dd MMMM - HH:mm",
}) {
  if (date is String) {
    return DateFormat(dateFormat, 'id').format(DateTime.parse(date));
  }
  if (date is DateTime) {
    return DateFormat(dateFormat, 'id').format(date);
  }
  return '';
}

bool isEmpty(dynamic val) {
  return [
    "",
    " ",
    null,
    'null',
    '{}',
    '[]',
    '0',
    '0.0',
  ].contains(val.toString());
}

bool isNotEmpty(dynamic val) {
  return ![
    "",
    " ",
    null,
    'null',
    '{}',
    '[]',
    '0',
    '0.0',
    '0.00',
  ].contains(val.toString());
}

void showToast(message, {bgColor, txtColor}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: bgColor ?? kPrimaryColor,
    textColor: txtColor ?? Colors.white,
    fontSize: 12.0,
  );
}
