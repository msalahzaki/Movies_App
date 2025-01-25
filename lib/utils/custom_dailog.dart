
import 'package:flutter/material.dart';



class CustomDailog {
  static List<Widget> actions = [];
  Function? firstButtonAction;

  static void showLoading(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Loading ..."),
              )
            ],
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessageDailog(BuildContext context,
      {String? title,
      String? message,
      String? firstButtonLabel,
      Function? firstButtonAction,
      String? secondButtonLabel,
      Function? secondButtonAction}) {
    actions = [];

    if (firstButtonLabel != null) {
      actions.add(TextButton(
          onPressed: () {
            if (firstButtonAction != null) {
              firstButtonAction.call();
            } else {
              Navigator.pop(context);
            }
          },
          child: Text(firstButtonLabel)));
    }
    if (secondButtonLabel != null) {
      actions.add(TextButton(
          onPressed: () {
            if (secondButtonAction != null) {
              secondButtonAction.call();
            } else {
              Navigator.pop(context);
            }
          },
          child: Text(
            secondButtonLabel,
          )));
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? ""),
          content: Text(
            message ?? "",

          ),
          actions: actions,
        );
      },
    );
  }
}
