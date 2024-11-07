import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/features/status/presentation/views/widgets/image_my_status.dart';
import 'package:minichat_project/features/status/presentation/views/widgets/image_status_widget.dart';
import 'package:minichat_project/features/status/presentation/views/widgets/title_my_status_widget.dart';

class MyStatusBody  extends StatelessWidget {
  const MyStatusBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ImageMyStatus(),
        SizedBox(width: 20.w,),
        const TitleMyStatusWidget(nameStatus: "My Status",timeStatus: "Tap to add status update",),
      ],
    );
  }
}
