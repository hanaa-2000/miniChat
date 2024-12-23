import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/constants/assets_app.dart';

class ImageItemWidget  extends StatelessWidget {
  const ImageItemWidget({super.key, required this.img});
final String img;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(
        img,
      ),
      radius: 30.r,
    );
  }
}
