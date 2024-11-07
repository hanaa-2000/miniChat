import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

displayToastMessage({required String msg}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0.sp);
}

navigatorAppReplacement(
    {required Widget widget, required BuildContext context}) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => widget,
  ));
}

navigatorApp({required Widget widget, required BuildContext context}) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => widget,
  ));
}
