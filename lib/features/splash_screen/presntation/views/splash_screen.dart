import 'package:flutter/material.dart';
import 'package:minichat_project/core/constants/assets_app.dart';
import 'package:minichat_project/core/themes/styles.dart';
import 'package:minichat_project/features/home/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigateScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      },
    );
  }
  @override
  void initState() {
   navigateScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size  = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.asset(AssetsApp.logoApp , ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "WhatsUp",
              style: StylesApp.textStyle24,
            ),
            const Spacer(),
            Text(
              "The best chat app of this century",
              style: StylesApp.textStyle21,
            ),
            const SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
