import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/themes/colors.dart';


BottomNavigationBarItem bottomNavBarItem({
  required IconData icon,
  String ? label,
}){

  return BottomNavigationBarItem(
      icon: Icon(icon ,color: ColorsApp.green,size: 24.sp,),
    label: label,
  );


}