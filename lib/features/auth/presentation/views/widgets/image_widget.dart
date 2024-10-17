import 'package:flutter/material.dart';
import 'package:minichat_project/core/constants/assets_app.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Image.asset(
      AssetsApp.logoApp,
      width: size.width,
      height: size.height / 4,
    );
  }
}
