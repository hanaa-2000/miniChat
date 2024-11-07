import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/shared_widgets/functions_helper.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/button_login.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/email_field.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/image_widget.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/passord_field.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/register_row.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/text_login.dart';
import 'package:minichat_project/features/home/presentation/views/home_screen.dart';

class LoginBody  extends StatelessWidget {
   LoginBody({super.key});
   TextEditingController emailController =TextEditingController();
   TextEditingController passwordController =TextEditingController();
   GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key:formKey ,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 SizedBox(height: 50.h,),
                const ImageWidget(),
                const TextLogin(),
                 SizedBox(height: 30.h,),
                EmailField(emailController: emailController,),
                 SizedBox(height: 20.h,),
                PasswordField(passwordController:passwordController ,),
                 SizedBox(height: 40.h,),
                ButtonLogin(
                  emailController: emailController,
                  passwordController: passwordController,
                  onSuccess: (){
                    navigatorAppReplacement(widget: const HomeScreen(), context: context);
                  },
                ),
                 SizedBox(height: 50.h),
                const RegisterRow(),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
