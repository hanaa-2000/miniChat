import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minichat_project/core/constants/firebase_consts.dart';
import 'package:minichat_project/features/auth/presentation/views/login_screen.dart';
import 'package:minichat_project/features/splash_screen/presntation/views/widgets/splash_body.dart';

import '../../../home/presentation/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  navigateScreen() {
    _timer=Timer(
      const Duration(seconds: 3),
      () {
        auth.authStateChanges().listen((User ? user) {
          if(mounted){
          if(user == null){
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          }else{
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          }
        }
        }
        );


      },
      );
  }

  @override
  void initState() {
     navigateScreen();
    super.initState();
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SplashBody(),
      ),
    );
  }
}
