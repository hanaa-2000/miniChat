import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/themes/colors.dart';

class FloatingActionWidget extends StatelessWidget {
  const FloatingActionWidget({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: ColorsApp.green,
      elevation: 0,
      child:  Icon(Icons.chat,color: Colors.white,size: 25.sp,),
    );
  }
}
