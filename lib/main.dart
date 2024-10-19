import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minichat_project/features/home/presentation/views/home_screen.dart';
import 'package:minichat_project/features/splash_screen/presntation/views/widgets/splash_body.dart';
import 'features/home/presentation/views/widgets/home_body.dart';
import 'features/splash_screen/presntation/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(),

      ),
      home:const SplashScreen(),
    );
  }
}

