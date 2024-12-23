import 'package:flutter/material.dart';
import 'package:minichat_project/core/themes/colors.dart';
import 'package:minichat_project/features/home/presentation/views/widgets/profile_body.dart';

class ProfileScreen  extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile",style: TextStyle(fontWeight: FontWeight.bold),),
        iconTheme: IconThemeData(color: ColorsApp.green),

      ),
      body: ProfileBody(),
    );
  }
}
