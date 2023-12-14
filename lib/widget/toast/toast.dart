import 'package:flutter/material.dart';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';

class MyToast {
  String? description;
  String? notifier;
  int? duration;
  BuildContext? context;

  toast(
    String description,
    String notifier,
    int duration,
    BuildContext context,
  ) {
    switch (notifier) {
      case "success":
        CherryToast.success(
          animationType: AnimationType.fromTop,
          title: const Text(""),
          displayTitle: false,
          description: Text(description),
          animationDuration: Duration(milliseconds: duration),
          autoDismiss: true,
        ).show(context);
        break;

      case "info":
        CherryToast.info(
          animationType: AnimationType.fromTop,
          title: const Text(""),
          displayTitle: false,
          description: Text(description),
          animationDuration: Duration(milliseconds: duration),
          autoDismiss: true,
        ).show(context);
        break;

      case "error":
        CherryToast.error(
          animationType: AnimationType.fromTop,
          title: const Text(""),
          displayTitle: false,
          description: Text(description),
          animationDuration: Duration(milliseconds: duration),
          autoDismiss: true,
        ).show(context);
        break;

      case "warning":
        CherryToast.warning(
          animationType: AnimationType.fromTop,
          title: const Text(""),
          displayTitle: false,
          description: Text(description),
          animationDuration: Duration(milliseconds: duration),
          autoDismiss: true,
        ).show(context);
        break;

      default:
        return null;
    }
  }
}
