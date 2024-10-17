import 'package:flutter/material.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/signup_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SignupBody(),
      ),
    );
  }
}
