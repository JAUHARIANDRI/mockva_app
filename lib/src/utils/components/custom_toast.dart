import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:mockva_app/src/utils/values/colors.dart';

class ToastFlush {
  static warning({BuildContext context, String message, int timer = 3}) {
    Flushbar(
      title: "Warning",
      message: message,
      icon: const Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.white,
      ),
      backgroundColor: Colors.orange,
      duration: timer != null ? Duration(seconds: timer) : null,
      boxShadows: const [
        BoxShadow(
          color: primaryColor,
          offset: Offset(0.0, 1.0),
          blurRadius: 2.0,
        )
      ],
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
    ).show(context);
  }

  static success({BuildContext context, String message, int timer = 3}) {
    Flushbar(
      title: "Success",
      message: message,
      icon: const Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.white,
      ),
      backgroundColor: Colors.green,
      duration: timer != null ? Duration(seconds: timer) : null,
      boxShadows: const [
        BoxShadow(
          color: primaryColor,
          offset: Offset(0.0, 1.0),
          blurRadius: 2.0,
        )
      ],
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
    ).show(context);
  }

  static error({BuildContext context, String message, int timer = 3}) {
    Flushbar(
      title: "Oopss",
      message: message,
      icon: const Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.white,
      ),
      backgroundColor: Colors.redAccent,
      duration: timer != null ? Duration(seconds: timer) : null,
      boxShadows: const [
        BoxShadow(
          color: primaryColor,
          offset: Offset(0.0, 1.0),
          blurRadius: 2.0,
        )
      ],
      margin: const EdgeInsets.all(8),
      // borderRadius: 8,
      borderRadius: BorderRadius.circular(8),
    ).show(context);
  }

  static info({BuildContext context, String message, int timer = 3}) {
    Flushbar(
      title: "Information",
      message: message,
      icon: const Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.white,
      ),
      backgroundColor: Colors.blueAccent,
      duration: timer != null ? Duration(seconds: timer) : null,
      boxShadows: const [
        BoxShadow(
          color: primaryColor,
          offset: Offset(0.0, 1.0),
          blurRadius: 2.0,
        )
      ],
      margin: const EdgeInsets.all(8),
      // borderRadius: 8,
      borderRadius: BorderRadius.circular(8),
    ).show(context);
  }
}
