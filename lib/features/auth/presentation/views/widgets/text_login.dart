import 'package:flutter/material.dart';
import 'package:minichat_project/core/themes/styles.dart';

class TextLogin  extends StatelessWidget {
  const TextLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Log in to your account",
      style: StylesApp.textStyleBold24,
    );
  }
}
