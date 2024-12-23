import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minichat_project/core/constants/firebase_consts.dart';
import 'package:minichat_project/features/auth/presentation/viewModel/auth_cubit.dart';
import 'package:minichat_project/features/auth/presentation/viewModel/manager/auth_services.dart';
import 'features/auth/presentation/views/login_screen.dart';
import 'features/chats/presentation/viewModel/chats_cubit/chats_cubit.dart';
import 'features/chats/presentation/viewModel/repo/firebase_services.dart';
import 'features/home/presentation/viewModel/home_cubit.dart';
import 'features/home/presentation/viewModel/home_services.dart';
import 'features/splash_screen/presntation/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  // This widget is the root of your application.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(AuthServices()),
        ),
        BlocProvider(
          create: (context) => ChatsCubit(FirebaseServices())
        ),
        BlocProvider(create: (context) => HomeCubit(HomeServices())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
              useMaterial3: true,
              textTheme: GoogleFonts.interTextTheme(),
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
