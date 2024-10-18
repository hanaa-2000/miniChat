import 'package:flutter/material.dart';
import 'package:minichat_project/core/themes/styles.dart';

import '../../../../../core/themes/colors.dart';

class ItemTimeWidget   extends StatelessWidget {
  const ItemTimeWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("12:00 PM",style: StylesApp.textStyle18.copyWith(color: Colors.black45),),
        const SizedBox(height: 15,),
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsApp.green,
          ),
          child: Center(
            child: Text(
              "2",
              style: StylesApp.textStyle16.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
