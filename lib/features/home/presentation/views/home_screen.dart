import 'package:flutter/material.dart';
import 'package:minichat_project/features/chats/presentation/views/widgets/floating_action_widget.dart';
import 'package:minichat_project/features/chats/presentation/views/widgets/chats_body.dart';
import 'package:minichat_project/features/home/presentation/views/widgets/home_body.dart';

class HomeScreen  extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
    );
  }
}






