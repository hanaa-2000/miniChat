import 'package:flutter/material.dart';
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
                const SizedBox(height: 50,),
                const ImageWidget(),
                const TextLogin(),
                const SizedBox(height: 30,),
                EmailField(emailController: emailController,),
                const SizedBox(height: 20,),
                PasswordField(passwordController:passwordController ,),
                const SizedBox(height: 40,),
                ButtonLogin(
                  emailController: emailController,
                  passwordController: passwordController,
                  onSuccess: (){
                    navigatorAppReplacement(widget: const HomeScreen(), context: context);
                  },
                ),
                const SizedBox(height: 50),
                const RegisterRow(),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
