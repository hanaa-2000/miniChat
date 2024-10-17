import 'package:flutter/material.dart';
import 'package:minichat_project/core/shared_widgets/functions_helper.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/button_signup.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/email_field.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/image_widget.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/login_row.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/name_field.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/passord_field.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/phone_field.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/register_text.dart';
import 'package:minichat_project/features/home/presentation/views/home_screen.dart';

class SignupBody  extends StatelessWidget {
   SignupBody({super.key});
  TextEditingController nameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   TextEditingController phoneController = TextEditingController();
   GlobalKey<FormState> formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ImageWidget(),
              const RegisterText(),
              const SizedBox(height: 20,),
              NameField(nameController:nameController ,),
              const SizedBox(height: 20,),
              EmailField(emailController: emailController),
              const SizedBox(height: 20,),
              PhoneField(phoneController: phoneController,),
              const SizedBox(height: 20,),
              PasswordField(passwordController: passwordController),
              const SizedBox(height: 30,),
              SignUpButton(
                phoneController: phoneController,
                nameController: nameController,
                passwordController: passwordController,
                emailController: emailController,
                onSuccess: (){
                  navigatorAppReplacement(widget: const HomeScreen(), context: context);
                },
              ),
              const SizedBox(height: 30,),
              const LoginRow(),


            ],
          ),
        ),
      ),
    );
  }
}
