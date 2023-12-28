import 'package:flutter/material.dart';

class MyDialog {
  Future<void> showMyDialog({
    required String title,
    required String description,
    required Function() confirmAction,
    required String confirmTitle,
    String? cancelTitle,
    required BuildContext context,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(description),
              ],
            ),
          ),
          actions: <Widget>[
            cancelTitle == "" || cancelTitle == null
                ? TextButton(
                    onPressed: confirmAction,
                    child: Text(confirmTitle),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text(cancelTitle),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        onPressed: confirmAction,
                        child: Text(confirmTitle),
                      ),
                    ],
                  ),
          ],
        );
      },
    );
  }
}
