import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/themes/colors.dart';


Widget defaultTextField({
  TextEditingController ? controller,
  String Function(String?)? validator,
  TextInputType? type,
  bool obscureText = false,
  String? hintText,
  IconData? icon,
  IconData? suffix,
  String? labelText,
  void Function()? onPressed,
  void Function(String)? onChanged,
  bool? enabled,
}){

  return TextFormField(
   controller:controller ,
    style:  TextStyle(fontSize: 14.sp),
    onChanged:onChanged ,
    enabled: enabled,
    validator: validator,
    keyboardType: type,
    obscureText:obscureText ,
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        //borderSide: BorderSide(color: ColorsApp.grey),
        borderRadius: BorderRadius.circular(30.r),
      ),
      suffixIcon:suffix != null ? IconButton(
          onPressed: onPressed,
          icon:  Icon(suffix),
      ):null,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsApp.primaryColor , width: 2.0),
      ),
      labelText: labelText,
    ),


  );






}
