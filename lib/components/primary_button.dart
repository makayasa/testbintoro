import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/config/constant.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = kBgWhite,
    this.fontWeight = FontWeight.normal,
    this.formBlock = true,
    this.padding = const EdgeInsets.all(13),
    this.fontSize = 18,
    this.borderRadius = const BorderRadius.all(Radius.circular(40)),
    this.disabled = false,
    this.useLoading = false,
    this.borderColor = kPrimaryColor,
    this.isOutlined = false,
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final Color color;
  final Color textColor;
  final FontWeight fontWeight;
  final EdgeInsets padding;
  final bool formBlock;
  final double fontSize;
  final BorderRadius borderRadius;
  final bool disabled;
  final bool useLoading;
  final Color borderColor;
  final bool isOutlined;

  static bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: isOutlined ? BorderSide(color: borderColor) : BorderSide.none,
      ),
      padding: padding,
      color: isOutlined
          ? kBgWhite
          : disabled
              ? kInactiveColor
              : color,
      minWidth: formBlock ? double.infinity : null,
      onPressed: () {
        if (Get.focusScope != null) {
          Get.focusScope!.unfocus();
        }
        press();
      },
      child: Text(
        text,
        style: TextStyle(
          color: isOutlined ? kPrimaryColor : textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
