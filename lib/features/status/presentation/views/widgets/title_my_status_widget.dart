import 'package:flutter/material.dart';
import 'package:minichat_project/core/themes/colors.dart';
import 'package:minichat_project/core/themes/styles.dart';

class TitleMyStatusWidget  extends StatelessWidget {
  const TitleMyStatusWidget({super.key, required this.nameStatus, required this.timeStatus});
  final String nameStatus;
  final String timeStatus;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(nameStatus ,style: StylesApp.textStyle18.copyWith(fontWeight: FontWeight.bold,),),
        Text(timeStatus,style: StylesApp.textStyle16.copyWith(color: Colors.black45,fontWeight: FontWeight.w600),),
      ],
    );
  }
}
