import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/shared_widgets/functions_helper.dart';
import 'package:minichat_project/features/auth/presentation/viewModel/auth_cubit.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/button_signup.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/email_field.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/image_widget.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/login_row.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/name_field.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/passord_field.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/phone_field.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/register_text.dart';
import 'package:minichat_project/features/home/presentation/views/home_screen.dart';

import '../../../../../core/themes/colors.dart';

class SignupBody extends StatelessWidget {
  SignupBody({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          navigatorAppReplacement(widget: const HomeScreen(), context: context);
        } else if (state is RegisterFailure) {
          displayToastMessage(msg: state.mesError);
        }
      },
      builder: (context, state) {
        return state is RegisterLoading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(ColorsApp.primaryColor),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ImageWidget(),
                        const RegisterText(),
                        SizedBox(
                          height: 20.h,
                        ),
                        NameField(
                          nameController: nameController,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        EmailField(emailController: emailController),
                        SizedBox(
                          height: 20.h,
                        ),
                        PhoneField(
                          phoneController: phoneController,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        PasswordField(passwordController: passwordController),
                        SizedBox(
                          height: 30.h,
                        ),
                        SignUpButton(
                          phoneController: phoneController,
                          nameController: nameController,
                          passwordController: passwordController,
                          emailController: emailController,
                          onSuccess: () {
                            BlocProvider.of<AuthCubit>(context).registerUser(
                              email: emailController.text,
                              name: nameController.text,
                              password: passwordController.text,
                              phone: phoneController.text,
                            );
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        const LoginRow(),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
