import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/constants/assets_app.dart';

class ImageStatusWidget  extends StatelessWidget {
  const ImageStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: const AssetImage(AssetsApp.img),
      radius:40.r,
    );
  }
}
