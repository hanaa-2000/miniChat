import 'package:flutter/material.dart';
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
      height: height??55,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical:10),
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
