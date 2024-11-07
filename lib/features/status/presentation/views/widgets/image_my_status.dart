import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/themes/colors.dart';
import 'package:minichat_project/features/status/presentation/views/widgets/image_status_widget.dart';

class ImageMyStatus  extends StatelessWidget {
  const ImageMyStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ImageStatusWidget(),
        Positioned(
          bottom:.5.h,
            right: .5.w,
            child:  CircleAvatar(
              radius: 12.r,
              backgroundColor: ColorsApp.green,
              child: Container(
                width: 20.w,
                height: 20.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                ),
                child: Center(
                  child: Icon(Icons.add,color: ColorsApp.green,size: 20.sp,),
                ),
              ),
            )
        ),
      ]


    );
  }
}
