import 'package:flutter/material.dart';
import 'package:minichat_project/features/auth/presentation/views/widgets/login_body.dart';

class LoginScreen  extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: LoginBody()),
    );
  }
}
