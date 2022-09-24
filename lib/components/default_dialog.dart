import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'default_text.dart';
import 'primary_button.dart';

class DefaultDialog extends StatelessWidget {
  DefaultDialog({
    required this.onConfirm,
    required this.errorMessage,
    this.confirmText = 'OK',
    this.cancelText = 'Back',
    this.onCancel,
    this.title = 'Uupps !',
    this.isOneButton,
  });

  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final String errorMessage;
  final String confirmText;
  final String cancelText;
  final String title;
  final bool? isOneButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DefText(title).large,
            SizedBox(height: 10),
            DefText(errorMessage, textAlign: TextAlign.center).normal,
            SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: confirmText,
                    press: onConfirm,
                    fontSize: 10,
                  ),
                ),
                SizedBox(width: 10),
                Visibility(
                  visible: isOneButton == false || isOneButton == null,
                  child: Expanded(
                    child: PrimaryButton(
                      isOutlined: true,
                      text: cancelText,
                      fontSize: 10,
                      press: onCancel ?? () => Get.back(),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
