import 'package:flutter/material.dart';
import 'package:minichat_project/core/themes/styles.dart';

class AppbarWidget  extends StatelessWidget  implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("WhatsUp" , style: StylesApp.textStyle24.copyWith(color: Colors.black),),
      actions: [
        iconButtonAction(icon: Icons.search,),
        iconButtonAction(icon: Icons.more_vert,),
      ],
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
    );
  }
  Widget iconButtonAction({void Function()? onPressed, IconData ?icon}) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(icon ,size: 25,color: Colors.black45,));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
