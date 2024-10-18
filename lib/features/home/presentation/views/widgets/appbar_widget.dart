import 'package:flutter/material.dart';
import 'package:minichat_project/core/themes/styles.dart';

import 'icon_button_action.dart';

class AppbarWidget  extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("WhatsUp" , style: StylesApp.textStyle24.copyWith(color: Colors.black),),
      actions: [
        IconButtonAction(icon: Icons.search,),
        IconButtonAction(icon: Icons.more_vert,),
      ],
    );
  }
}
