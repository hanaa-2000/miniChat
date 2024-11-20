import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/constants/firebase_consts.dart';
import 'package:minichat_project/core/shared_widgets/functions_helper.dart';
import 'package:minichat_project/core/themes/styles.dart';
import 'package:minichat_project/features/auth/presentation/viewModel/auth_cubit.dart';
import 'package:minichat_project/features/home/presentation/views/profile_screen.dart';
import 'package:minichat_project/features/splash_screen/presntation/views/splash_screen.dart';

import '../../features/home/presentation/views/new_group_screen.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      title: Text(
        "WhatsUp",
        style: StylesApp.textStyle24.copyWith(color: Colors.black),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon:  Icon(
              Icons.search,
              size: 25.sp,
              color: Colors.black45,
            )),
        PopupMenuButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: const BorderSide(color: Colors.grey, width: .5),
          ),
          icon: const Icon(Icons.more_vert),
          constraints:  BoxConstraints(minWidth: 200.w),
          color: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          position: PopupMenuPosition.under,
          itemBuilder: (context) {
            return [
               PopupMenuItem<String>(
                child: const Text("New Group",style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewGroupScreen(),));
                },
              ),
               PopupMenuItem(
                child: const Text("Profile",style: TextStyle(fontWeight: FontWeight.bold)),
                 onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
                 },
              ),
              PopupMenuItem(
                child: const Text("Logout",style: TextStyle(fontWeight: FontWeight.bold)),

                onTap: ()async{
                  // BlocProvider.of<AuthCubit>(context).logout();
                  await FirebaseAuth.instance.signOut();
                  FirebaseAuth.instance.authStateChanges().listen((User? user) {
                    if (user == null ) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const SplashScreen()));
                      print("User is signed out.");

                    } else {
                      print("User is signed in: ${user.uid}");
                      // Continue with authenticated operations
                    }
                  });
                  // navigatorAppReplacement(widget: const SplashScreen(), context: context);
                  // SystemNavigator.pop();
                },
              ),
            ];
          },
        ),
      ],
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
