import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/themes/colors.dart';
import 'package:minichat_project/features/status/presentation/views/widgets/image_status_widget.dart';

class ImageStatusRecent  extends StatelessWidget {
  const ImageStatusRecent({super.key, required this.statusRead});
   final bool statusRead ;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: statusRead ? ColorsApp.green:Colors.grey,
      radius: 43.r,
      child: const ImageStatusWidget(),
    );
  }
}
