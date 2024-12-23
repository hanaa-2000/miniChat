import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/themes/styles.dart';

import '../../../../../core/themes/colors.dart';

class ItemTimeWidget   extends StatelessWidget {
  const ItemTimeWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("12:00 PM",style: StylesApp.textStyle18.copyWith(fontSize: 12.sp,color: Colors.black45),),
         SizedBox(height: 6.h,),
        Container(
          width: 20.w,
          height: 20.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsApp.green,
          ),
          child: Center(
            child: Text(
              "2",
              style: StylesApp.textStyle16.copyWith(fontSize: 14.sp,color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
