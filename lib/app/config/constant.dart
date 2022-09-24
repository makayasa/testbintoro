import 'package:flutter/material.dart';

const channelId = '1234';

const kPrimaryColor = Color(0xFF52B3D9);
const kBgBlack = Color(0xFF191508);
const kBgWhite = Color(0xFFfafafa);
const kInactiveColor = Color(0xFFa6a6a6);

const kDefSidePadding = EdgeInsets.symmetric(horizontal: 20);

//* key storage
const kNote = 'notes';

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
