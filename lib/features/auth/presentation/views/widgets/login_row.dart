import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/themes/colors.dart';
import 'package:minichat_project/features/auth/presentation/views/login_screen.dart';

import '../../../../../core/shared_widgets/functions_helper.dart';
import '../../../../../core/themes/styles.dart';

class LoginRow   extends StatelessWidget {
  const LoginRow ({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Already have an account? ",style: StylesApp.textStyle21.copyWith(fontSize: 18.sp),),
        GestureDetector(
            onTap: (){
              navigatorApp(widget:const LoginScreen() , context: context);
            },
            child: Text("Login here",style: StylesApp.textStyle24.copyWith(fontSize: 18.sp,color: ColorsApp.primaryColor),)),
      ],
    );
  }
}
