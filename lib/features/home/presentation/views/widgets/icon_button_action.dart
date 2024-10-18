import 'package:flutter/material.dart';

class IconButtonAction  extends StatelessWidget {
  const IconButtonAction({super.key, this.onPressed, this.icon});
final void Function()? onPressed;
final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(icon ,size: 25,color: Colors.black45,));
  }
}
