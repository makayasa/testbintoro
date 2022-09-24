import 'package:flutter/material.dart';

const channelId = '1234';
const baseNotifId = 100;
const reminderBaseNotifId = 2000;

const kPrimaryColor = Color(0xFF52B3D9);
const kBgBlack = Color(0xFF191508);
const kBgWhite = Color(0xFFfafafa);
const kInactiveColor = Color(0xFFa6a6a6);

const kDefaultFastDuration = Duration(milliseconds: 250);
const kDefaultDuration = Duration(milliseconds: 500);

const kDefSidePadding = EdgeInsets.symmetric(horizontal: 20);

//* key storage
const kNotes = 'notes';
const kNotifId = 'notificationId';

const kDefaultBorderRadius = BorderRadius.all(
  Radius.circular(7),
);
const kDefaultBorderRadius10 = BorderRadius.all(
  Radius.circular(10),
);

TextStyle get kDefaultTextStyle {
  return TextStyle(
    color: kBgBlack,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );
}
