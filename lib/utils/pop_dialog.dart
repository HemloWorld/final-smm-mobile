import 'package:final_project/widgets/bottom_dialog.dart';
import 'package:final_project/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';

class PopDialog {
  static showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingDialog();
        });
  }

  static showBottomDialog(BuildContext context, Widget message) {
    showDialog(
        context: context,
        builder: (context) {
          return BottomDialog(
            message: message,
          );
        });
  }
}
