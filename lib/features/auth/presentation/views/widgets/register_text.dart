import 'package:flutter/material.dart';
import 'package:minichat_project/core/themes/styles.dart';

class RegisterText  extends StatelessWidget {
  const RegisterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Register To New account",
      style: StylesApp.textStyleBold24,
    );
  }
}
