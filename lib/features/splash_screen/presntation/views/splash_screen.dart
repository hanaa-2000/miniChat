import 'package:flutter/material.dart';
import 'package:minichat_project/features/splash_screen/presntation/views/widgets/splash_body.dart';

import '../../../home/presentation/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigateScreen() {
    Future.delayed(
      const Duration(seconds: 90),
      () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      },
    );
  }

  @override
  void initState() {
    // navigateScreen();
    super.initState();
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
