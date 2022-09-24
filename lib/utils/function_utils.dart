import 'dart:convert';
import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

import 'package:timezone/timezone.dart' as tz;

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
