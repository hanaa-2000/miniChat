import 'package:flutter/material.dart';
import 'package:minichat_project/core/themes/colors.dart';
import 'package:minichat_project/core/themes/styles.dart';

class ItemChatWidget  extends StatelessWidget {
  const ItemChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("rowan" ,style: StylesApp.textStyle21.copyWith(fontWeight: FontWeight.w500),),
        Text("#01000101001",style: StylesApp.textStyle18.copyWith(color: ColorsApp.blue),)
      ],
    );
  }
}
