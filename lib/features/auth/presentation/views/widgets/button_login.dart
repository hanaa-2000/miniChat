import 'package:flutter/material.dart';
import 'package:minichat_project/core/shared_widgets/functions_helper.dart';
import 'package:minichat_project/core/themes/colors.dart';

import '../../../../../core/shared_widgets/custom_button.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin(
      {super.key,
      required this.emailController,
      required this.passwordController,
      this.onSuccess});

  final TextEditingController emailController;

  final TextEditingController passwordController;

  final void Function()? onSuccess;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: customButton(
        text: "Log In",
        buttonColor: ColorsApp.green,
        onPressed: () {
          if (!emailController.text.contains('@')) {
            displayToastMessage(msg: "Email address isn't valid");
          } else if (passwordController.text.isEmpty) {
            displayToastMessage(msg: "Password is mandatory");
          } else {
            onSuccess!();
          }
        },
      ),
    );
  }
}
