import 'package:flutter/material.dart';
import 'package:minichat_project/core/shared_widgets/custom_button.dart';

import '../../../../../core/shared_widgets/functions_helper.dart';
import '../../../../../core/themes/colors.dart';

class SignUpButton  extends StatelessWidget {
  const SignUpButton({super.key, required this.emailController, required this.passwordController, required this.nameController, required this.phoneController, this.onSuccess});
  final TextEditingController emailController;

  final TextEditingController passwordController;
  final TextEditingController nameController;

  final TextEditingController phoneController;

  final void Function()? onSuccess;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: customButton(
          text: "Sign Up",
        buttonColor: ColorsApp.green,
        onPressed: (){
            if(nameController.text.isEmpty){
              displayToastMessage(msg: "Name isn't Empty");
            }
          else if (!emailController.text.contains('@')) {
            displayToastMessage(msg: "Email address isn't valid");
          }  else if (phoneController.text.isEmpty) {
              displayToastMessage(msg: "Phone isn't valid");
            }else if (passwordController.text.isEmpty) {
            displayToastMessage(msg: "Password is mandatory");
          } else {
            onSuccess!();
          }
        },

      ),
    );
  }
}
