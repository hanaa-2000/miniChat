import 'package:flutter/material.dart';

import '../../../../../core/themes/colors.dart';


BottomNavigationBarItem bottomNavBarItem({
  required IconData icon,
  String ? label,
}){

  return BottomNavigationBarItem(
      icon: Icon(icon ,color: ColorsApp.green,size: 30,),
    label: label,
  );


}