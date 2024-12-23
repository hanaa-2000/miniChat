import 'package:flutter/material.dart';
import 'package:minichat_project/core/themes/colors.dart';
import 'package:minichat_project/core/themes/styles.dart';

class ItemChatWidget  extends StatelessWidget {
  const ItemChatWidget({super.key, required this.name, required this.phone});
final String name ,phone;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name ,style: StylesApp.textStyle18.copyWith(fontWeight: FontWeight.w500),),
        Text(phone,style: StylesApp.textStyle16.copyWith(color: Colors.blueGrey)),
    ],
    );
  }
}
