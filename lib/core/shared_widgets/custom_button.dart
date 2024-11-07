import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/themes/styles.dart';

Widget customButton({
  required String text,
  void Function()? onPressed,
  BorderRadiusGeometry ? borderRe,
  Color ? buttonColor,
  Color?textColor,
  double ? width,
  double ? height,

}) {
  return Center(
    child: SizedBox(
      width: width??double.infinity,
      height: height??55.h,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding:  EdgeInsets.symmetric(horizontal: 40.w, vertical:10.h),
            shape: RoundedRectangleBorder(
              borderRadius:borderRe ??BorderRadius.circular(24) ,
            ),
            backgroundColor: buttonColor,

          ),
          child: Text(
            text,
            style: StylesApp.textStyle24.copyWith(color:textColor??Colors.black, ),
          )),
    ),
  );
}
