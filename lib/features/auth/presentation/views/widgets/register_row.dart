import 'package:flutter/material.dart';
import 'package:minichat_project/core/shared_widgets/functions_helper.dart';
import 'package:minichat_project/core/themes/colors.dart';
import 'package:minichat_project/core/themes/styles.dart';
import 'package:minichat_project/features/auth/presentation/views/signup_screen.dart';

class RegisterRow   extends StatelessWidget {
  const RegisterRow ({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Don’t have an account? ",style: StylesApp.textStyle21.copyWith(fontSize: 18),),
        GestureDetector(
            onTap: (){
              navigatorApp(widget:const SignUpScreen() , context: context);
            },
            child: Text("Register here",style: StylesApp.textStyle24.copyWith(fontSize: 18,color: ColorsApp.primaryColor),)),
      ],
    );
  }
}
