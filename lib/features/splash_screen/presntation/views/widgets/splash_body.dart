import 'package:flutter/material.dart';
import '../../../../../core/constants/assets_app.dart';
import '../../../../../core/themes/styles.dart';

class SplashBody  extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size  = MediaQuery.of(context).size;
    return Column(
      children: [
         SizedBox(
          height: size.height/9,
        ),
        Center(
          child: Image.asset(AssetsApp.logoApp ,width:size.width ,height: size.height/3, ),
        ),
         SizedBox(
          height: size.height/40,
        ),
        Text(
          "WhatsUp",
          style: StylesApp.textStyle24,
        ),
        const Spacer(),
        Text(
          "The best chat app of this century",
          style: StylesApp.textStyle21,
        ),
         SizedBox(height:size.height/5,),
      ],
    );
  }
}
